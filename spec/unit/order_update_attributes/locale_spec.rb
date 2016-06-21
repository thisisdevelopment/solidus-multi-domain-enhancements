describe Spree::OrderUpdateAttributes do
  let(:order) { create(:order) }
  let(:request_env) { nil }
  let(:update) { described_class.new(order, attributes, request_env: request_env) }

  let(:attributes) do
    {}
  end

  context 'setting current store locale' do
    subject { order.locale }

    around do |example|
      I18n.locale = :es
      example.run
      I18n.locale = I18n.default_locale
    end

    before do
      update.apply
      order.reload
    end

    it { is_expected.to eq('es') }
  end
end
