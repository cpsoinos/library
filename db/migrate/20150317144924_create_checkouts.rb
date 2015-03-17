class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.datetime :date, default: DateTime.now
      t.string :name, null: false
      t.datetime :return, default: DateTime.now
      # t.integer :book_id, null: false
    end

    # add_column :books, :checkout_id, :integer
  end
end
