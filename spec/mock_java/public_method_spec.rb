require 'spec_helper'

java_import 'test.PublicMethod'

describe 'classes with public methods' do
  before(:each) do
    @mock = mock_java PublicMethod
  end

  context 'when is changing behaviour' do
    it 'should mock methods with no parameters' do
      expect(@mock).to receive(:getPublicMethod).and_return 'mock'
      expect(@mock.getPublicMethod).to eq('mock')
    end

    it 'should mock methods with 1 parameters' do
      expect(@mock).to receive(:getPublicMethodArg1).and_return 'mock'
      expect(@mock.getPublicMethodArg1 'param1').to eq('mock')
    end

    it 'should mock methods with 2 parameters' do
      expect(@mock).to receive(:getPublicMethodArg2).and_return 'mock'
      expect(@mock.getPublicMethodArg2 'param1', 'param2').to eq('mock')
    end

    it 'should mock methods with varargs parameters' do
      expect(@mock).to receive(:getPublicMethodVarargs).and_return 'mock'

      output = @mock.getPublicMethodVarargs %w(param1 param2).to_java
      expect(output).to eq('mock')
    end
  end

  context 'when is not changing behaviour' do
    it 'should call the the original methods with no parameters' do
      expect(@mock.getPublicMethod).to eq('PublicMethod')
    end

    it 'should call original methods with 1 parameters' do
      expect(@mock.getPublicMethodArg1 'test').to eq('test')
    end

    it 'should call original methods with 2 parameters' do
      expect(@mock.getPublicMethodArg2 'test1', 'test2').to eq('test1 test2')
    end

    it 'should call original methods with varargs parameters' do
      output = @mock.getPublicMethodVarargs(%w(param1 param2).to_java(:string))
      expect(output.to_a).to eq(%w(param1 param2))
    end
  end
end
