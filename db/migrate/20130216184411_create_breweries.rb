class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :guid
      t.string :name
      t.text :description
      t.string :website
      t.integer :established
      t.boolean :is_organic
      t.string :image_url
      t.datetime :remote_update_date

      t.timestamps
    end
  end
end
