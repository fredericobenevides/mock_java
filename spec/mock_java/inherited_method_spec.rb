require 'spec_helper'

java_import 'test.inheritance.A'
java_import 'test.inheritance.B'
java_import 'test.inheritance.C'

describe 'mocking methods on a class with inheritance' do
  context 'mocking the parent class' do
    it 'should mock the method' do
      a = mock_java A

      expect(a).to receive(:methodA).and_return 'mock A'
      expect(a.methodA).to eq('mock A')
    end
  end

  context 'mocking the child class' do
    it 'should mock the method' do
      b = mock_java B

      expect(b).to receive(:methodB).and_return 'mock B'
      expect(b.methodB).to eq('mock B')
    end
  end

  context 'mocking the grandchild class' do
    it 'should mock the method' do
      c = mock_java C

      expect(c).to receive(:methodC).and_return 'mock C'
      expect(c.methodC).to eq('mock C')
    end
  end
end

describe 'expecting parents methods to be called on child classes' do
  context 'for parent class' do
    let(:a) { mock_java A }

    it 'should not see that method from parent Object class was called' do
      expect(a).to_not receive(:hashCode)
    end

    it 'should see that his method was called' do
      expect(a).to receive(:methodA).and_call_original

      a.runMethod
      expect(a.output).to eq("Method A ")
    end
  end

  context 'for child class' do
    let(:b) { mock_java B }

    it 'should see that parent method was called' do
      expect(b).to receive(:methodA).once
      b.runMethod
    end

    it 'should see that his method was called' do
      expect(b).to receive(:methodB).and_call_original

      b.runMethod
      expect(b.output).to eq("Method A Method B ")
    end
  end

  context 'for grandchild class' do
    let(:c) { mock_java C }

    it 'should see that grandparent method was called' do
      expect(c).to receive(:methodA).once
      c.runMethod
    end

    it 'should see that parent method was called' do
      expect(c).to receive(:methodB).once
      c.runMethod
    end

    it 'should see that his method was called' do
      expect(c).to receive(:methodC).and_call_original

      c.runMethod
      expect(c.output).to eq("Method A Method B Method C ")
    end
  end
end
