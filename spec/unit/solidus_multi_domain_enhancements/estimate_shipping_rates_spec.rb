describe SolidusMultiDomainEnhancements::EstimateShippingRates do
  let(:klass) { described_class.new(order, [shipping_method]) }
  let(:order) { create(:order_with_line_items, line_items_count: 2) }
  let(:shipping_method) { create(:shipping_method) }

  describe '#contents' do
    subject { klass.contents }

    it { is_expected.to be_an(Array) }
    it { is_expected.to include(SolidusMultiDomainEnhancements::EstimateContentItem) }
  end

  describe '#order' do
    subject { klass.order }

    it { is_expected.to be_a(Spree::Order) }
  end

  describe '#amount' do
    subject { klass.for_rabl.first['amount'] }

    context 'when using a flat rate calculator' do
      it { is_expected.to eq(10.0) }
    end

    context 'when using a percentage calculator' do
      let(:shipping_method) do
        create(:shipping_method, calculator: build(:shipping_flat_percentage_calculator))
      end

      it { is_expected.to eq(4.0) }
    end

    context 'when using a per item calculator' do
      let(:shipping_method) do
        create(:shipping_method, calculator: build(:shipping_per_item_calculator))
      end

      it { is_expected.to eq(4.0) }
    end

    context 'when using a flexi item calculator' do
      let(:shipping_method) do
        create(:shipping_method, calculator: build(:shipping_flexi_rate_calculator))
      end

      it { is_expected.to eq(11) }
    end
  end
end
