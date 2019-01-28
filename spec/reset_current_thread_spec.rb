RSpec.describe ResetCurrentThread do
  it 'has a version number' do
    expect(ResetCurrentThread::VERSION).not_to be nil
  end

  context '.all!' do
    it 'resets all local thread context (fiber + thread)' do
      Thread.current.thread_variable_set(:foo, 1)
      Thread.current[:bar] = 2

      expect(Thread.current.thread_variable_get(:foo)).to eq(1)
      expect(Thread.current[:bar]).to eq(2)

      subject.all!

      expect(Thread.current.thread_variable_get(:foo)).to eq(nil)
      expect(Thread.current[:bar]).to eq(nil)
    end
  end

  context '.fiber_locals!' do
    it 'resets succesfully' do
      Thread.current[:foo] = 1
      Thread.current[:bar] = 2

      expect(Thread.current[:foo]).to eq(1)
      expect(Thread.current[:bar]).to eq(2)

      subject.fiber_locals!

      expect(Thread.current[:foo]).to eq(nil)
      expect(Thread.current[:bar]).to eq(nil)
    end
  end

  context '.thread_locals!' do
    it 'resets succesfully' do
      Thread.current.thread_variable_set(:foo, 1)
      Thread.current.thread_variable_set(:bar, 2)

      expect(Thread.current.thread_variable_get(:foo)).to eq(1)
      expect(Thread.current.thread_variable_get(:bar)).to eq(2)

      subject.thread_locals!

      expect(Thread.current.thread_variable_get(:foo)).to eq(nil)
      expect(Thread.current.thread_variable_get(:bar)).to eq(nil)
    end
  end
end
