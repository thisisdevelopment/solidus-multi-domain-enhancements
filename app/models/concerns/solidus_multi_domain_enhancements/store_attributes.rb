module SolidusMultiDomainEnhancements
  module StoreAttributes
    extend ActiveSupport::Concern

    included do
      validates :order_number_prefix, uniqueness: true
      validates :default_locale, format: { without: /\s/ }
      validates :timezone, inclusion: { in: TZInfo::Timezone.all_identifiers }
    end

    def default_locale
      self[:default_locale].try(:to_sym) || I18n.default_locale
    end

    def timezone
      self[:timezone] || 'Europe/London'
    end
  end
end
