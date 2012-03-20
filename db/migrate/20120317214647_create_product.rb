class CreateProduct < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.references :category, :null => false
      t.string :company, :null => false
      t.string :name, :null => false
      t.boolean :premier, :null => false
      t.integer :position
    end
  end

  def down
    drop_table :products
  end
end
