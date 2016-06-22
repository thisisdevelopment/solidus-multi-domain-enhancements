module SolidusMultiDomainEnhancements
  module OrderUpdateAttributes
    extend ActiveSupport::Concern

    def apply
      assign_current_locale

      super
    end

    private

    def assign_current_locale
      order.locale = I18n.locale
    end
  end
end
