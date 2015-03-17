class CreateCategoryBooks < ActiveRecord::Migration
  def change
    create_table :category_books do |t|
      t.integer :book_id, null: false
      t.integer :category_id, null: false
    end
  end
end
