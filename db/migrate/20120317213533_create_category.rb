class CreateCategory < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name, :null => false
      t.integer :position
    end
  end

  def down
    drop_table :categories
  end
end
