class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.text :location
      t.string :image
      t.integer :price
      t.integer :upvotes

      t.timestamps
    end
  end
end
