$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'decongestant/version'

Gem::Specification.new do |s|
  s.name = 'decongestant'
  s.platform = Gem::Platform::RUBY
  s.version = Decongestant::VERSION
  s.authors = ['Tyler Ball']
  s.email = ['tyler@tylerball.net']
  s.homepage = 'http://www.shopify.com'
  s.summary = `git log -1`.split(/\n/)[0][7..-1].to_s
  s.description = 'Compile assets from sprockets to files easily.'

  s.files = Dir['{lib}/**/*', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'sprockets'
  s.add_dependency 'rake'
  s.add_dependency 'rails'
end
