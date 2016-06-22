module SolidusMultiDomainEnhancements
  module CurrencySymbolPosition
    extend ActiveSupport::Concern

    included do
      before_action :set_currency_symbol_position
    end

    private

    def set_currency_symbol_position
      Spree::Money.default_formatting_rules.merge!(
        sign_before_symbol: current_store.currency_symbol_first
      )
    end
  end
end
