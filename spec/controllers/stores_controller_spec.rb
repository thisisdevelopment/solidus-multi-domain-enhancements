describe 'Shipment method shipping rates', type: :request do
  let(:store) { create(:store) }
  let(:user) { create(:user).tap(&:generate_spree_api_key) }

  let(:shipping_method) do
    create(:shipping_method, cost: 10.00)
  end

  let(:cheap_shipping_method) do
    create(:shipping_method, cost: 1.00)
  end

  before do
    user.generate_spree_api_key!
    get("/api/store/shipping_methods", token: user.spree_api_key)
  end

  it 'displays the available shipping methods' do
    shipping_methods = JSON.parse(response.body)

    p shipping_methods

    expect(shipping_methods.map(&:keys).flatten.uniq).to include('cost')
    expect(shipping_methods.map{ |s| s['cost'] }.flatten.uniq).to include(10.00)
  end
end
