# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcalibur/sld/version'

Gem::Specification.new do |spec|
  spec.name          = "xcalibur-sld"
  spec.version       = Xcalibur::Sld::VERSION
  spec.authors       = ["Ryan M. Taylor, John T. Prince"]
  spec.email         = ["jtprince@gmail.com"]
  spec.description   = %q{gem for parsing the Xcalibur Thermo SLD file, a file used to specify the sequence of mass spectrometry runs}
  spec.summary       = %q{gem for parsing the Xcalibur Thermo SLD file}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
