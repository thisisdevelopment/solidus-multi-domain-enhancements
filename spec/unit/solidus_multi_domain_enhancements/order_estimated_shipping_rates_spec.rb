module Spree
  describe Api::OrdersController, type: :controller do
    render_views

    let!(:store) { create(:store, :with_shipping_methods) }
    let(:user) { create(:admin_user).tap(&:generate_spree_api_key!) }
    let(:order) { create(:order_with_line_items, store: store) }

    before do
      get :estimate_shipping_rates, id: order.number, token: user.spree_api_key, format: :json
    end

    it 'displays the estimated shipping rates' do
      shipping_rates = JSON.parse(response.body)

      expect(shipping_rates['shipping_rates'].map(&:keys).flatten.uniq).to include('amount')
      expect(shipping_rates['shipping_rates'].map{ |s| s['amount'] }.flatten.uniq).to include('10.0')
    end
  end
end
