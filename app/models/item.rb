class Item < ApplicationRecord
  belongs_to :category
  has_many :shopping_list_items
  has_many :shopping_lists, through: :shopping_list_items

  validates :name, :note, presence: true, allow_blank: false
end
