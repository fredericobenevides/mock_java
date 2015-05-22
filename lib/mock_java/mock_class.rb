module MockJava
  def mock_java(clazz, *init_with)
    MockClass.new(clazz, *init_with).mock
  end

  class MockClass
    def initialize(clazz, *init_with)
      @clazz = clazz
      @test_class_name = create_test_class_name
      @init_with = init_with
    end

    def create_test_class_name
      if @clazz.java_class.name =~ /(\w+)$/
        "Test#{$1}"
      end
    end

    def create_ruby_initialize
      if @init_with
        params = ''
        @init_with.size.times do |t|
            params << "param#{t},"
        end
        params.gsub!(/(.*),$/, '\1')

        "\n def initialize(#{params})\n super #{params}\n end"
      end
    end

    def create_ruby_methods
      java_methods = @clazz.java_class.declared_instance_methods
      java_methods.collect! { |x| [x.name, x.generic_parameter_types.size]}

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
      class_creation = <<-EOF
        class #{@test_class_name} < #{@clazz}
          #{create_ruby_initialize}
          #{create_ruby_methods}
        end
      EOF

      eval class_creation

      created_class = MockJava::MockClass.const_get(@test_class_name)
      if @init_with
        created_class.new *@init_with
      else
        created_class.new
      end
    end

  end

end
