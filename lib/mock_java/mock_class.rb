module MockJava
  def mock_java(clazz, *init_with)
    MockClass.new(clazz, *init_with).mock
  end

  class MockClass
    def initialize(clazz, *init_with)
      load_class clazz
      @test_class_name = create_test_class_name
      @init_with = init_with
    end

    def mock
      child_class = Class.new(@clazz)
      add_ruby_methods_to child_class

      if @init_with
        child_class.new *@init_with
      else
        child_class.new
      end
    end

    private
    def load_class(clazz)
      if clazz.java_kind_of? Class
        @clazz = clazz
      else
        @clazz = clazz.class
      end
    end

    def create_test_class_name
      if @clazz.java_class.name =~ /(\w+)$/
        "Test#{$1}"
      end
    end

    def add_ruby_methods_to(child_class)
      java_methods = load_java_methods @clazz.java_class

      ruby_methods = java_methods.inject("") do |s, m|
        method_name  = m[0]
        total_params = m[1]

        create_ruby_method child_class, method_name, total_params
      end
    end

    def create_ruby_method(child_class, method_name, total_params = 0)
      if total_params == 0
        child_class.class_eval "def #{method_name}; super; end"
      else
        joined_params = ''
        total_params.times do |t|
          joined_params << "param#{t},"
        end
        joined_params.gsub!(/(.*),$/, '\1')

        child_class.class_eval "def #{method_name}(#{joined_params}); super #{joined_params}; end"
      end
    end

    def load_java_methods(java_class, child_java_methods = [])
      java_methods = child_java_methods

      if java_class.name != "java.lang.Object"
        java_methods = java_class.declared_instance_methods
        java_methods.collect! { |x| [x.name, x.generic_parameter_types.size]}

        # add the methods from child and parent, remove duplicates
        java_methods = java_methods + child_java_methods
        java_methods.uniq!

        java_methods = load_java_methods java_class.superclass, java_methods
      end

      java_methods
    end

  end

end
