describe Spree::OrderUpdateAttributes do
  let(:store) { create(:store, :with_default_locale) }
  let(:order) { create(:order, store: store) }
  let(:request_env) { nil }
  let(:update) { described_class.new(order, attributes, request_env: request_env) }

  let(:attributes) do
    {}
  end

  subject { order.locale }

  it { is_expected.to eq(:fr) }

  context 'setting current store locale' do
    around do |example|
      I18n.locale = :es
      example.run
      I18n.locale = I18n.default_locale
    end

    before do
      update.apply
      order.reload
    end

    it { is_expected.to eq(:es) }
  end
end
