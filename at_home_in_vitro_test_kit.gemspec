require_relative 'lib/at_home_in_vitro_test_kit/version'

Gem::Specification.new do |spec|
  spec.name          = 'at_home_in_vitro_test_kit'
  spec.version       = AtHomeInVitroTestKit::VERSION
  spec.authors       = ['Inferno Team']
  spec.date          = Time.now.utc.strftime('%Y-%m-%d')
  spec.summary       = 'Inferno tests for the At Home In Vitro IG'
  spec.description       = 'Inferno tests for the At Home In Vitro IG'
  spec.homepage      = 'https://github.com/inferno-framework/inferno-template'
  spec.license       = 'Apache-2.0'
  spec.add_runtime_dependency 'inferno_core', '~> 1.0', '>= 1.0.2'
  spec.add_development_dependency 'database_cleaner-sequel', '~> 1.8'
  spec.add_development_dependency 'factory_bot', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'webmock', '~> 3.11'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.3.6')
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/inferno-framework/at-home-in-vitro-test-kit'
  spec.files         = `[ -d .git ] && git ls-files -z lib config/presets LICENSE`.split("\x0")
  spec.require_paths = ['lib']
  spec.metadata['inferno_test_kit'] = 'true'
end
