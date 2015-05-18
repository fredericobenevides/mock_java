require 'spec_helper'

require 'mock_java'

java_import 'test.Example'

describe MockJava do
  it 'has a version number' do
    expect(MockJava::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  it 'should return hello world' do
    msg = Example.new.hello_world
    expect(msg).to eq('Hello World')
  end
end
