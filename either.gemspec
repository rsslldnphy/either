Gem::Specification.new do |s|
  s.name          = 'either'
  s.version       = '0.1'
  s.date          = '2013-11-29'
  s.summary       = "Stop using exceptions for control flow with Either types"
  s.description   = "A simple container that can hold one of two types"
  s.author        = "Russell Dunphy"
  s.email         = 'rssll@rsslldnphy.com'
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.homepage      = 'http://github.com/rsslldnphy/either'
  s.license       = 'MIT'

  s.add_dependency "optional"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "mocha"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "coveralls"
end
