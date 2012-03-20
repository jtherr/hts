class CreateNewsItem < ActiveRecord::Migration
  def up
    create_table :news_items do |t|
      t.datetime :date, :null => false
      t.string :description, :null => false
    end
  end

  def down
    drop_table :news_items
  end
end
