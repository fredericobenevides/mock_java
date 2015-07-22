require 'spec_helper'

java_import 'test.inheritance.X'
java_import 'test.inheritance.Y'
java_import 'test.inheritance.Z'

describe 'mocking class with constructors' do
  context 'mocking the parent class' do
    it 'should mock with constructor' do
      x = mock_java X, 'mock 1', 'mock 2'
      expect(x.output).to eq('mock 1 mock 2')
    end
  end

  context 'mocking the child class' do
    it 'should mock with constructor' do
      y = mock_java Y, 'mock 1', 'mock 2'
      expect(y.output).to eq('mock 1 mock 2')
    end
  end

  context 'mocking the grandchild class' do
    it 'should mock with constructor' do
      z = mock_java Z, 'mock 1', 'mock 2'
      expect(z.output).to eq('mock 1 mock 2')
    end
  end
end

describe 'mocking object with constructors' do
  context 'mocking the parent object' do
    # it 'should mock with constructor' do
    it '22' do
      x = X.new 'mock 1', 'mock 2'
      x = mock_java x, 'mock 1', 'mock 2'
      expect(x.output).to eq('mock 1 mock 2')
    end
  end

  context 'mocking the child object' do
    # it 'should mock with constructor' do
    it '22' do
      y = Y.new 'mock 1', 'mock 2'
      y = mock_java y, 'mock 1', 'mock 2'
      expect(y.output).to eq('mock 1 mock 2')
    end
  end

  context 'mocking the grandchild object' do
    # it 'should mock with constructor' do
    it '22' do
      z = Z.new 'mock 1', 'mock 2'
      z = mock_java z, 'mock 1', 'mock 2'
      expect(z.output).to eq('mock 1 mock 2')
    end
  end
end
