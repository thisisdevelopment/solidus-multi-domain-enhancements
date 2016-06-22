class AddCurrencySymbolFirstToSpreeStore < ActiveRecord::Migration
  def change
    add_column :spree_stores, :currency_symbol_first, :boolean, default: true
  end
end
