# frozen_string_literal: true

require 'reset_current_thread/version'

module ResetCurrentThread
  autoload :Middleware, 'reset_current_thread/middleware'

  # Sets all items in the current current thread and fiber local to nil
  #
  # @return [Thread] current thread object.
  def self.all!
    fiber_locals!
    thread_locals!
  end

  # Sets all items in the current current thread fiber local to nil
  #
  # @return [Thread] current thread object.
  def self.fiber_locals!
    Thread.current.keys.each do |key|
      Thread.current[key] = nil
    end
    Thread.current
  end

  # Sets all items in the current current thread local to nil
  #
  # @return [Thread] current thread object.
  def self.thread_locals!
    Thread.current.thread_variables.each do |key|
      Thread.current.thread_variable_set(key, nil)
    end
    Thread.current
  end
end
