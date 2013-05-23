class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :guid
      t.string :name
      t.text :description
      # t.decimal :abv, :precision => 10, :scale => 1
      t.float :abv
      t.integer :ibu
      t.boolean :is_organic
      t.string :label_url

      t.string :style_id
      t.integer :brewery_id
      
      t.datetime :remote_update_date
      
      t.timestamps
    end
  end
end
