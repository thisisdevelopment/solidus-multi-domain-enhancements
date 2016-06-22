module SolidusMultiDomainEnhancements
  module OrderAttributes
    extend ActiveSupport::Concern

    def generate_order_number(options = {})
      options[:length]  ||= Spree::Order::ORDER_NUMBER_LENGTH
      options[:letters] ||= Spree::Order::ORDER_NUMBER_LETTERS
      options[:prefix]  ||= order_prefix

      possible = (0..9).to_a
      possible += ('A'..'Z').to_a if options[:letters]

      self.number ||= loop do
        random = "#{options[:prefix]}#{(0...options[:length]).map { possible.sample }.join}"

        if self.class.exists?(number: random)
          options[:length] += 1 if self.class.count > (10**options[:length] / 2)
        else
          break random
        end
      end
    end

    def locale
      self[:locale].try(:to_sym) || store.try(:default_locale)
    end

    private

    def order_prefix
      store.order_number_prefix || Spree::Order::ORDER_NUMBER_PREFIX
    end
  end
end
