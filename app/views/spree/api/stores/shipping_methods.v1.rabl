object false
child @shipping_methods => :shipping_methods do
  attributes :id, :name
  node(:amount) { |s| s.calculator.preferences[:amount] }
end
