describe SolidusMultiDomainEnhancements::CurrencySymbolPosition, type: :controller do
  let(:store) { create(:store) }

  controller(ApplicationController) do
    include SolidusMultiDomainEnhancements::CurrencySymbolPosition

    def fake_index
      render nothing: true
    end
  end

  before do
    expect(controller).to receive(:current_store).and_return(store)

    routes.draw { get 'fake_index' => 'anonymous#fake_index' }

    get :fake_index
  end

  subject { Spree::Money.default_formatting_rules[:sign_before_symbol] }

  it { is_expected.to eq(true) }

  context 'when currency_symbol_first is false' do
    let(:store) { create(:store, :with_currency_symbol_last) }

    it { is_expected.to eq(false) }
  end
end
