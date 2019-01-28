RSpec.describe ResetCurrentThread::Middleware do
  class DummyRackApp
    def call(_env); end
  end

  context 'rack request' do
    before do
      @app = DummyRackApp.new
      @middleware = ResetCurrentThread::Middleware.new(@app)
    end

    it 'resets thread context after the end of request' do
      Thread.current.thread_variable_set(:foo, 1)
      Thread.current[:bar] = 2

      expect(Thread.current.thread_variable_get(:foo)).to eq(1)
      expect(Thread.current[:bar]).to eq(2)

      @middleware.call({})

      expect(Thread.current.thread_variable_get(:foo)).to eq(nil)
      expect(Thread.current[:bar]).to eq(nil)
    end
  end
end
