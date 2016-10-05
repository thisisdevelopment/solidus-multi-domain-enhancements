Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api, defaults: { format: 'json' } do
    get 'store/shipping_methods', to: 'stores#shipping_methods'
  end
end
