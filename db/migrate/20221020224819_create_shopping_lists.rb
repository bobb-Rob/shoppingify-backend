class CreateShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.boolean :is_completed, null: false, default: false     
      t.boolean :is_cancelled, null: false, default: false    

      t.timestamps
    end
  end
end
