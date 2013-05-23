class CreateKegs < ActiveRecord::Migration
  def change
    create_table :kegs do |t|
      t.integer :beer_id
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_on_tap, :default => false

      t.timestamps  
    end
  end
end
