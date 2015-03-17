class AddReaderIdToCheckouts < ActiveRecord::Migration
  class Checkout < ActiveRecord::Base # define within migration our own local instance of this object
    belongs_to :reader
  end
  class Reader < ActiveRecord::Base
  end   # because these are more local than our overall class objects


  def up
    add_column :checkouts, :reader_id, :integer

    Checkout.all.each do |checkout|
      reader = Reader.find_by(name: checkout.name)
      if reader.present?
        checkout.reader_id = reader.reader_id   # this is if first and last name aren't separate columns
      else
        Reader.create(
          name: checkout.name,
          email: "",
          phone: ""
          )
        checkout.reader_id = reader.id
      end
      checkout.save
    end

    remove_column :checkouts, :name
  end

  def down
    add_column :checkouts, :name, :string

    Checkout.all.each do |checkout|
      checkout.name = checkout.reader.name
      checkout.save
    end

    remove_colulmn :checkouts, :reader_id
  end
end
