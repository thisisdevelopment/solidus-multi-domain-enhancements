module SolidusMultiDomainEnhancements
  module CurrencySymbolPosition
    extend ActiveSupport::Concern

    included do
      before_action :set_currency_symbol_position
    end

    private

    def set_currency_symbol_position
      Spree::Money.default_formatting_rules.merge!(symbol_position)
    end

    def symbol_position
      if current_store.currency_symbol_before
        { symbol_position: :before }
      else
        { symbol_position: :after }
      end
    end
  end
end
