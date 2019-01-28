lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reset_current_thread/version'

Gem::Specification.new do |spec|
  spec.name          = 'reset_current_thread'
  spec.version       = ResetCurrentThread::VERSION
  spec.authors       = ['Shayon Mukherjee']
  spec.email         = ['shayonj@gmail.com']

  spec.summary       = 'Simple lib to reset thread local context on demand. Includes a rack middleware plugin.'
  spec.description   = 'Simple lib to reset thread local context on demand. Includes a rack middleware plugin.'
  spec.homepage      = 'https://github.com/shayonj/reset_current_thread'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.required_ruby_version = '>= 2.0.0'
end
