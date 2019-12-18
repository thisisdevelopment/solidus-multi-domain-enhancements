child @estimate_package => :shipping_rates do
  node(:name) { |o| o[:name] }
  node(:description) { |o| o[:description] }
  node(:amount) { |o| o[:amount].to_d }
  node(:display_amount) { |o| o[:amount].to_s }
end
