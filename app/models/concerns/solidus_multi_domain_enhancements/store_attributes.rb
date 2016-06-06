module SolidusMultiDomainEnhancements
  module StoreAttributes
    extend ActiveSupport::Concern

    included do
      validates :default_locale, format: { without: /\s/ }
      validates :timezone, inclusion: { in: TZInfo::Timezone.all_identifiers }
    end

    def order_number_prefix
      self[:order_number_prefix] || Spree::MultiDomainConfig[:order_number_prefix]
    end

    def default_locale
      self[:default_locale].try(:to_sym) || I18n.default_locale
    end

    def timezone
      self[:timezone] || Spree::MultiDomainConfig[:timezone]
    end
  end
end
