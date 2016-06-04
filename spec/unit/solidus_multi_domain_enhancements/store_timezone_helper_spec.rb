describe SolidusMultiDomainEnhancements::StoreTimezoneHelper, type: :helper do
  let(:store) { create(:store, :with_timezone) }
  let(:timestamp) { Time.now }
  let(:expected_timestamp) { timestamp.in_time_zone(store.timezone) }

  before do
    expect(helper).to receive(:current_store) { store }
  end

  context '#localized_time_for_store' do
    subject { helper.localized_time_for_store(timestamp) }

    context 'when its a timestamp' do
      it { is_expected.to eq(expected_timestamp) }
    end

    context 'when its a sting' do
      let(:timestamp) { Time.now.to_s }
      let(:expected_timestamp) { Time.parse(timestamp).in_time_zone(store.timezone) }

      it { is_expected.to eq(expected_timestamp) }
    end
  end
end
