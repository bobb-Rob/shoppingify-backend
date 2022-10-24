class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :shopping_list_items
  has_many :shopping_lists, through: :shopping_list_items

  validates :name, :note, presence: true, allow_blank: false
end
