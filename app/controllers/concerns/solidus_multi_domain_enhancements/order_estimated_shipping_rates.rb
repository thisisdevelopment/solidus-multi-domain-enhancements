module SolidusMultiDomainEnhancements
  module OrderEstimatedShippingRates
    extend ActiveSupport::Concern

    def estimate_shipping_rates
      authorize! :show, @order, order_token

      available_shipping_methods = current_store
        .shipping_methods
        .where
        .not(display_on: 'back_end')

      @estimate_package = SolidusMultiDomainEnhancements::EstimateShippingRates
        .new(@order, available_shipping_methods)
        .for_rabl

      respond_with(@estimate_package)
    end
  end
end
