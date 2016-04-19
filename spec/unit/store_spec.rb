describe Spree::Store do
  let(:store) { create(:store, :with_order_number_prefix) }

  subject { store.order_number_prefix }

  it { is_expected.to eq('MADE') }
end
