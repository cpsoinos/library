class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :rating, :inclusion => { :in => 1..100 }

  # belongs_to :checkout
  has_many :category_books
  has_many :categories, through: :category_books
end
