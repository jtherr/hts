class AddProducts < ActiveRecord::Migration
  
  def change
    Product.create(:category => Category.find_by_name('Abrasives'), :name => 'Grinding Wheels, Diamond Wheels, Borazon Wheels', :premier => false, :position => 0, :company => 'US Diamond Wheel')
    Product.create(:category => Category.find_by_name('Hand Tools'), :name => 'Assembly, Drilling, Drive Tools, Clamping', :premier => false, :position => 0, :company => 'Amstrong')
    Product.create(:category => Category.find_by_name('Hand Tools'), :name => 'Assembly, Drilling, Drive Tools, Clamping', :premier => false, :position => 0, :company => 'Proto')
    Product.create(:category => Category.find_by_name('Hand Tools'), :name => 'Assembly, Drilling, Drive Tools, Clamping', :premier => false, :position => 0, :company => 'Blackhawk')
    Product.create(:category => Category.find_by_name('Safety'), :name => 'Glasses, Machine Guarding', :premier => false, :position => 0, :company => 'Flexbar')
    Product.create(:category => Category.find_by_name('Saw Blades'), :name => 'Band Saws', :premier => false, :position => 0, :company => 'Eberle')
    Product.create(:category => Category.find_by_name('Saw Blades'), :name => 'Band Saws', :premier => false, :position => 0, :company => 'Lenox')
    Product.create(:category => Category.find_by_name('Spindle Repair'), :name => 'Band Saws', :premier => false, :position => 0, :company => 'Riten Industries')
    Product.create(:category => Category.find_by_name('Tool Repair'), :name => 'Tool Repair, Live Tools', :premier => false, :position => 0, :company => 'WTO')
    Product.create(:category => Category.find_by_name('Tool Repair'), :name => 'Tool Repair, Live Tools', :premier => false, :position => 0, :company => 'Command')
    Product.create(:category => Category.find_by_name('Tool Repair'), :name => 'Tool Repair, Live Tools', :premier => false, :position => 0, :company => 'Eppinger')
    Product.create(:category => Category.find_by_name('Tool Repair'), :name => 'Tool Repair, Live Tools', :premier => false, :position => 0, :company => 'Chip''s Tool Repair')
    Product.create(:category => Category.find_by_name('Tool Repair'), :name => 'Tool Repair, Live Tools', :premier => false, :position => 0, :company => 'Carbide Tool Repair')
  end

end
