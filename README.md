# MockJava - Mocking java classes in Ruby World!

## Essential Information

Mock java is not a real mock, but a lib that creates a ruby class that extends
java classes.

Since it creates a ruby class, you can use rspec to change the behaviour class
since it's a real Ruby class!

I created this since I don't like the idea of using rspec using tools from
java classes to mock like Mockito! So if you have the same will, this might be
your tool!

## Usage

First include the module in your `spec_helper` file:

```ruby
RSpec.configure do |config|
  config.include MockJava
end
```

after importing your java file with:

`java_import com.package.ExampleJavaClass`

To mock this example class you mock with this command:

`mock = mock_java ExampleJavaClass`

If you need you need to pass arguments to your constructors use this:

`mock = mock_java ExampleJavaClass, 'param1', 'param2'`

## Contributting to MockJava

* For, fix, then send me a pull request.
