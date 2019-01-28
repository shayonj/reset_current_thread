# frozen_string_literal: true

module ResetCurrentThread
  class Middleware
    def initialize(app)
      @app = app
    end

    # Sets all items in the current thread and fiber local to nil, in the end.
    def call(env)
      @app.call(env)
    ensure
      ResetCurrentThread.all!
    end
  end
end
