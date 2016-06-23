class RenameCurrencySymbolFirstInSpreeStore < ActiveRecord::Migration
  def change
    rename_column :spree_stores, :currency_symbol_first, :currency_symbol_before
  end
end
