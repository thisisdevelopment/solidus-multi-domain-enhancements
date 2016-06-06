module Spree
  class MultiDomainConfiguration < Preferences::Configuration
    preference :order_number_prefix, :string, default: 'R'
    preference :timezone, :string, default: 'Europe/London'
  end
end
