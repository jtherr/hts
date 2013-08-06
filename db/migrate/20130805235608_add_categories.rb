class AddCategories < ActiveRecord::Migration
  def up
    ["Abrasives", "Hand Tools", "Safety", "Saw Blades", "Spindle Repair", "Tool Repair"].each_with_index do |name, i|
      Category.create(:name => name, :position => i + 8)
    end
  end
  
  def down
    Category.delete_all("name in ('Abrasives', 'Hand Tools', 'Safety', 'Saw Blades', 'Spindle Repair', 'Tool Repair')")
  end
end
