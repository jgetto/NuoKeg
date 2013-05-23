class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.string :guid

      t.timestamps
    end
  end
end
