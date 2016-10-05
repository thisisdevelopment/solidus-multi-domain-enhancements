module SolidusMultiDomainEnhancements
  module ShowShippingMethods
    extend ActiveSupport::Concern

    def shipping_methods
      p 'HERE'
      p @store
      authorize! :read, @store
      p 'PAST AUTH'
      respond_with(current_store.shipping_methods)
    end
  end
end
