module SolidusMultiDomainEnhancements
  module StoreAttributes
    extend ActiveSupport::Concern

    included do
      validates :order_number_prefix, uniqueness: true
    end

    def default_locale
      self[:default_locale] || I18n.default_locale.to_s
    end
  end
end
