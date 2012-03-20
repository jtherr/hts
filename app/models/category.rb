class Category < ActiveRecord::Base
  has_many :products
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name,
    :with => /^[A-Za-z0-9&\s,\-]*$/
    
  default_scope :order => 'position'
end
