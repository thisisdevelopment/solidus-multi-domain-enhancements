describe SolidusMultiDomainEnhancements::MailerTimezoneHelper, type: :helper do
  let(:store) { create(:store, :with_timezone) }
  let(:order) { create(:order_ready_to_ship, store: store) }
  let(:expected_timestamp) { order.completed_at.in_time_zone(store.timezone) }

  before do
    assign(:order, order)
  end

  context '#localized_order_complete_at' do
    subject { helper.localized_order_complete_at }

    context 'when its a timestamp' do
      it { is_expected.to eq(expected_timestamp) }
    end
  end
end
