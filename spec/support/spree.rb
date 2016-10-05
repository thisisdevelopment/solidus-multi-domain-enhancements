require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/factories'
require 'spree/testing_support/preferences'
require 'spree/testing_support/url_helpers'

require 'solidus_multi_domain_enhancements/factories'
require 'spree_multi_domain/testing_support/factory_overrides'

RSpec.configure do |config|
  config.include Spree::TestingSupport::Preferences
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::AuthorizationHelpers, type: :controller
  config.include Spree::TestingSupport::ControllerRequests, type: :controller
end
