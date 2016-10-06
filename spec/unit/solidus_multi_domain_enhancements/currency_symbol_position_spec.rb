describe SolidusMultiDomainEnhancements::CurrencySymbolPosition, type: :controller do
  let(:store) { create(:store) }

  controller(ApplicationController) do
    include SolidusMultiDomainEnhancements::CurrencySymbolPosition

    def fake_index
      render nothing: true
    end
  end

  before do
    routes.draw { get 'fake_index' => 'anonymous#fake_index' }

    get :fake_index, server_name: store.name
  end

  subject { Spree::Money.default_formatting_rules[:symbol_position] }

  it { is_expected.to eq(:before) }

  context 'when currency_symbol_before is false' do
    let(:store) { create(:store, :with_currency_symbol_after) }

    it { is_expected.to eq(:after) }
  end
end
