require 'spec_helper'

java_import 'test.PublicMethod'

describe 'mocking objects' do

  it 'should mock the object' do
    mock = mock_java PublicMethod.new

    expect(mock).to receive(:getPublicMethod).and_return 'mock'
    expect(mock.getPublicMethod).to eq('mock')
  end

end
