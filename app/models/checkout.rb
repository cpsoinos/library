class Checkout < ActiveRecord::Base
  belongs_to :book
  # has_many :books
end
