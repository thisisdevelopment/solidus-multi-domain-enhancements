describe Spree::Store do
  let(:store) { create(:store) }

  subject { store.default_locale }

  context 'when no locale is set' do
    it { is_expected.to eq(:en) }
  end

  context 'when the locale is set to fr' do
    let(:store) { create(:store, :with_default_locale) }

    it { is_expected.to eq(:fr) }
  end
end
