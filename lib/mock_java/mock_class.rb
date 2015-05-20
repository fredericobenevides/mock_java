module MockJava
  def mock_java(clazz)
    MockClass.new(clazz).mock
  end

  class MockClass
    def initialize(clazz)
      @clazz = clazz
      @test_class_name = create_test_class_name
    end

    def create_test_class_name
      if @clazz.java_class.name =~ /(\w+)$/
        "Test#{$1}"
      end
    end

    def load_java_methods
      java_methods = @clazz.java_class.declared_instance_methods
      java_methods.collect { |x| [x.name, x.generic_parameter_types.size]}
    end

    def create_ruby_methods
      java_methods = load_java_methods

      ruby_methods = java_methods.inject("") do |s, m|
        method_name  = m[0]
        total_params = m[1]

        if total_params == 0
          s << "\n define_method :#{method_name} do\n super \nend"
        else
          params = ''
          total_params.times do |t|
            params << "param#{t},"
          end
          params.gsub!(/(.*),$/, '\1')

          s << "\n define_method :#{method_name} do |#{params}| \n super #{params} \n end"
        end
      end
    end

    def mock
      ruby_methods = create_ruby_methods

      class_creation = <<-EOF
        class #{@test_class_name} < #{@clazz}
          #{ruby_methods}
        end

        #{@test_class_name}.new
      EOF

      eval class_creation
    end

  end

end
