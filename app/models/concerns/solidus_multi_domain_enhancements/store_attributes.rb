module SolidusMultiDomainEnhancements
  module StoreAttributes
    extend ActiveSupport::Concern

    included do
      validates :order_number_prefix, uniqueness: true
    end
  end
end
