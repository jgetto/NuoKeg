class CreateTaps < ActiveRecord::Migration
  def change
    create_table :taps do |t|
      t.string :name

      t.timestamps
    end
    
     add_column :kegs, :tap_id, :integer
    
  end
end
