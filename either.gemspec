Gem::Specification.new do |s|
  s.name          = 'either'
  s.version       = '0.0.2'
  s.date          = '2013-07-10'
  s.summary       = "Either types with pattern matching"
  s.description   = "Stop using exceptions for control flow!"
  s.authors       = ["Russell Dunphy"]
  s.email         = ['russell@russelldunphy.com']
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.homepage      = 'http://github.com/rsslldnphy/either'
  s.license       = 'MIT'

  s.add_runtime_dependency "optional"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"

end
