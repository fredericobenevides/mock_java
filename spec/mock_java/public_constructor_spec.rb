require 'spec_helper'

java_import 'test.PublicConstructor'

describe 'classes with public constructores' do

  context 'when using no arguments' do
    it 'should call the parent default constructor' do
      mock = mock_java PublicConstructor
      expect(mock.getMessage).to eq('Default Constructor')
    end
  end

  context 'when using the init arguments' do
    it 'should call the parent constructor with 1 parameters for 1 argument' do
      mock = mock_java PublicConstructor, 'mock1'
      expect(mock.getMessage).to eq('Constructor 1: mock1')
    end

    it 'should call the parent constructor with 2 parameters for 2 argument' do
      mock = mock_java PublicConstructor, 'mock1', 'mock2'
      expect(mock.getMessage).to eq('Constructor 2: mock1 mock2')
    end

    it 'should call the parent constructor when using varargs' do
      mock = mock_java PublicConstructor, 'mock1', 'mock2', 'mock3'
      expect(mock.getMessage).to eq('Constructor Varargs1: [mock1, mock2, mock3]')
    end
  end

end
