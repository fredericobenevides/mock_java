require 'spec_helper'

java_import 'test.PublicMethod'

describe 'mocking objects' do

  before(:each) do
    obj = PublicMethod.new
    @mock = mock_java obj
  end

  it 'should mock the object' do
      expect(@mock).to receive(:getPublicMethod).and_return 'mock'
      expect(@mock.getPublicMethod).to eq('mock')
  end

end
