# -*- encoding: utf-8 -*-
require File.expand_path('../lib/html2markdown/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["mike lee"]
  gem.email         = ["mike.d.1984@gmail.com"]
  gem.description   = %q{simple and flexible html to markdown converter}
  gem.summary       = %q{simple and flexible html to markdown converter}
  gem.homepage      = "https://github.com/29decibel/html2markdown"

	gem.add_dependency 'nokogiri'
  
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "html2markdown"
  gem.require_paths = ["lib"]
  gem.version       = HTML2Markdown::VERSION
end
