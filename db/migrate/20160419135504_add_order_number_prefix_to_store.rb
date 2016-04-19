class AddOrderNumberPrefixToStore < ActiveRecord::Migration
  def change
    change_table :spree_stores do |t|
      t.string :order_number_prefix, unique: true
    end
  end
end
