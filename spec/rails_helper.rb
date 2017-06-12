ENV['RAILS_ENV'] ||= 'test'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

ActiveJob::Base.queue_adapter = :test

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.mock_with :rspec

  config.order = :random

  config.color = true

  config.tty = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end
