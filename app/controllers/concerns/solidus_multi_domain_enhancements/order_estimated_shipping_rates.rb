module SolidusMultiDomainEnhancements
  module OrderEstimatedShippingRates
    extend ActiveSupport::Concern

    def estimate_shipping_rates
      authorize! :show, @order, order_token

      @estimate_package = SolidusMultiDomainEnhancements::EstimateShippingRates.new(@order, current_store.shipping_methods).for_rabl

      respond_with(@estimate_package)
    end
  end
end
