module SolidusMultiDomainEnhancements
  module ShowShippingMethods
    extend ActiveSupport::Concern

    included do
      skip_before_action :get_store, only: :shipping_methods
    end

    def shipping_methods
      @shipping_methods = current_store.shipping_methods
      respond_with(@shipping_methods)
    end

  end
end
