Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api, defaults: { format: 'json' } do
    get 'order/:id/estimate_shipping_rates', to: 'orders#estimate_shipping_rates'
  end
end
