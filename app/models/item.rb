class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :shopping_list_items
  has_many :shopping_lists, through: :shopping_list_items

  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :note, presence: true, lenght: { minimum: 20, maximum: 500 }
  validates :category, presence: true
  validates :image, allow_blank: true
end
