require "#{File.dirname(__FILE__)}/lib/rcat/version"

Gem::Specification.new do |s|
  s.name          = 'rcat'
  s.version       = RCat::VERSION
  s.date          = '2012-11-19'
  s.summary       = "A ruby version of the Unix command cat"
  s.authors       = ["Shawn Young"]
  s.email         = 'cm@codermonkey.ca'
  s.files         = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.require_path = 'lib'
  s.executables   = ["rcat"]
  s.required_ruby_version = ">= 1.9.3"
  s.required_rubygems_version = ">= 1.3.6"
end
