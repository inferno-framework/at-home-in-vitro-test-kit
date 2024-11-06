require_relative 'lib/at_home_in_vitro_test_kit/version'

Gem::Specification.new do |spec|
  spec.name          = 'at_home_in_vitro_test_kit'
  spec.version       = AtHomeInVitroTestKit::VERSION
  spec.authors       = ['Inferno Team']
  spec.email         = ['inferno@groups.mitre.org']
  spec.date          = Time.now.utc.strftime('%Y-%m-%d')
  spec.summary       = 'Inferno tests for the At Home In Vitro IG'
  spec.description       = 'Inferno tests for the At Home In Vitro IG'
  spec.homepage      = 'https://github.com/inferno-framework/inferno-template'
  spec.license       = 'Apache-2.0'
  spec.add_runtime_dependency 'inferno_core', '~> 0.5.0'
  spec.add_development_dependency 'database_cleaner-sequel', '~> 1.8'
  spec.add_development_dependency 'factory_bot', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'webmock', '~> 3.11'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.1.2')
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/inferno-framework/at-home-in-vitro-test-kit'
  spec.files = [
    Dir['lib/**/*.rb'],
    Dir['lib/**/*.json'],
    'LICENSE'
  ].flatten

  spec.require_paths = ['lib']
end
