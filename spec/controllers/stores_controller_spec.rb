module Spree
  describe Api::StoresController, type: :controller do
    render_views

    let!(:store) { create(:store, :with_shipping_methods) }
    let(:user) { create(:admin_user).tap(&:generate_spree_api_key!) }

    before do
      get :shipping_methods, token: user.spree_api_key, format: :json
    end

    it 'displays the available shipping methods' do
      shipping_methods = JSON.parse(response.body)

      expect(shipping_methods['shipping_methods'].map(&:keys).flatten.uniq).to include('amount')
      expect(shipping_methods['shipping_methods'].map{ |s| s['amount'] }.flatten.uniq).to include('10.0')
    end
  end
end
