class AddDefaultLocaleToStore < ActiveRecord::Migration
  def change
    change_table :spree_stores do |t|
      t.string :default_locale
    end
  end
end
