class Category < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :category_books
  has_many :books, through: :category_books
end
