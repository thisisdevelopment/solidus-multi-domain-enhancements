cache [I18n.locale, @order, 'estimate_package']

child @estimate_package => :shipping_rates do
  node(:name) { |o| o[:name] }
  node(:description) { |o| o[:description] }
  node(:amount) { |o| o[:amount] }
end
