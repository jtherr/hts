class FixSpindleRepairProduct < ActiveRecord::Migration
  def change
    Product.update_all "name = 'Spindle Repair'", "company = 'Riten Industries'"
  end
end
