class AddUserRefToShoppingList < ActiveRecord::Migration[7.0]
  def change
    add_reference :shopping_lists, :user, null: false, foreign_key: true
  end
end
