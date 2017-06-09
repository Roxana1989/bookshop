require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Bookshop
  class Application < Rails::Application
  end
end
