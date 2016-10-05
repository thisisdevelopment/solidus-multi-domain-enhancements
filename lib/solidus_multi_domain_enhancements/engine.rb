module SolidusMultiDomainEnhancements
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_multi_domain_enhancements'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_multi_domain_enhancements.environment', before: 'spree.environment' do
      Spree::MultiDomainConfig = Spree::MultiDomainConfiguration.new
    end

    initializer 'solidus_multi_domain_enhancements.permitted_attributes', after: :load_config_initializers do
      Spree::PermittedAttributes.store_attributes << :default_locale
      Spree::PermittedAttributes.store_attributes << :timezone
      Spree::PermittedAttributes.store_attributes << :order_number_prefix
      Spree::PermittedAttributes.store_attributes << :currency_symbol_before
    end

    def self.activate
      Spree::Order.prepend(SolidusMultiDomainEnhancements::OrderAttributes)
      Spree::OrderUpdateAttributes.prepend(SolidusMultiDomainEnhancements::OrderUpdateAttributes)
      Spree::Store.include(SolidusMultiDomainEnhancements::StoreAttributes)

      Spree::StoreHelper.include(SolidusMultiDomainEnhancements::StoreTimezoneHelper)
      Spree::BaseMailer.include(SolidusMultiDomainEnhancements::BaseMailerHelpers)

      Spree::Api::BaseController.include(SolidusMultiDomainEnhancements::CurrencySymbolPosition)
      Spree::Api::StoresController.include(SolidusMultiDomainEnhancements::ShowShippingMethods)
      Spree::BaseController.include(SolidusMultiDomainEnhancements::CurrencySymbolPosition)

      Dir.glob(File.join(File.dirname(__FILE__), '../../app/overrides/*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
