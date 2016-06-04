require 'spec_helper'

describe 'language attribute within the orders API' do
  let(:store) { create(:store) }
  let(:user) { create(:user).tap(&:generate_spree_api_key!) }
  let(:order) { create(:order_with_line_items, user: user) }

  it 'uses the stores default_locale' do
    get "/api/orders/#{order.number}", token: user.spree_api_key

    order_response = JSON.parse(response.body)
    expect(order_response[:language]).to eq(store.default_locale)
  end
end
