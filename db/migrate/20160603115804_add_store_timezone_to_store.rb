class AddStoreTimezoneToStore < ActiveRecord::Migration
  def change
    change_table :spree_stores do |t|
      t.string :timezone
    end
  end
end
