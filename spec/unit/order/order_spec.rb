describe Spree::Order do
  let(:store) { create(:store, :with_order_number_prefix) }
  let(:order) { create(:order, store: store) }

  subject { order.number }

  it { is_expected.to start_with('MADE') }
end
