module SolidusMultiDomainEnhancements
  class EstimateShippingRates
    def initialize(order, shipping_methods)
      @order = order
      @shipping_methods = shipping_methods
    end

    attr_reader :order, :contents, :for_rabl

    def contents
      @contents ||= @order.line_items.map{ |item| EstimateContentItem.new(item) }
    end

    def for_rabl
      @shipping_methods.map do |shipping_method|
        shipping_method.attributes.merge('amount' => amount(shipping_method)).with_indifferent_access
      end
    end

    private

    def amount(shipping_method)
      Spree::Money.new(shipping_method.calculator.compute_package(self), currency: @order.currency)
    end
  end
end
