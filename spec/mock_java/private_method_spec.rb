require 'spec_helper'

java_import 'test.PrivateMethod'

describe 'classes with private methods' do

  before(:each) do
    @mock = mock_java PrivateMethod
  end

  context 'when is changing behaviour' do
    it 'should mock methods with no parameters' do
      expect(@mock).to receive(:getPrivateMethod).and_return 'mock'
      expect(@mock.getPrivateMethod).to eq('mock')
    end

    it 'should mock methods with 1 parameters' do
      expect(@mock).to receive(:getPrivateMethodArg1).and_return 'mock'
      expect(@mock.getPrivateMethodArg1 'param1').to eq('mock')
    end

    it 'should mock methods with 2 parameters' do
      expect(@mock).to receive(:getPrivateMethodArg2).and_return 'mock'
      expect(@mock.getPrivateMethodArg2 'param1', 'param2').to eq('mock')
    end

    it 'should mock methods with varargs parameters' do
      expect(@mock).to receive(:getPrivateMethodVarargs).and_return 'mock'
      output = @mock.getPrivateMethodVarargs %w(param1 param2).to_java
      expect(output).to eq('mock')
    end
  end

  context 'when is not changing behaviour'  do
    it 'should raise calling methods with no parameters that are private' do
      expect {
        @mock.getPrivateMethod.to eq('PrivateMethod')
      }.to raise_error NoMethodError, /no superclass method/
    end

    it 'should raise calling methods with 1 parameteres that are private' do
      expect {
        @mock.getPrivateMethodArg1 'test1'
      }.to raise_error NoMethodError, /no superclass method/
    end

    it 'should raise calling methods with 2 parameteres that are private' do
      expect {
        @mock.getPrivateMethodArg2 'test1', 'test2'
      }.to raise_error NoMethodError, /no superclass method/
    end

    it 'should raise calling methods with varargs params that are private' do
      expect {
        @mock.getPrivateMethodVarargs(%w(param1 param2).to_java(:string))
      }.to raise_error NoMethodError, /no superclass method/
    end
  end

end
