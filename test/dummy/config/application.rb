require_relative 'boot'

require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require 'decongestant'

module Dummy
  class Application < Rails::Application
  end
end

