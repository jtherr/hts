class CreateQuoteRequest < ActiveRecord::Migration
  def up
    create_table :quote_requests do |t|
      t.string :name, :null => false
      t.string :company, :null => false
      t.string :phone, :null => false
      t.string :fax
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :additional
      t.datetime :date, :null => false
    end
  end

  def down
    drop_table :quote_requests
  end
end
