module SolidusMultiDomainEnhancements
  class EstimateContentItem
    def initialize(line_item)
      @line_item = line_item
    end

    attr_reader :line_item

    def variant
      line_item.variant
    end

    def state
      variant.in_stock
    end

    def weight
      variant.weight * quantity
    end

    def on_hand?
      variant.in_stock
    end

    def price
      variant.price
    end

    def amount
      price * quantity
    end

    def quantity
      # Since inventory units don't have a quantity,
      # make this always 1 for now, leaving ourselves
      # open to a different possibility in the future,
      # but this massively simplifies things for now
      1
    end
  end
end
