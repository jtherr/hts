class Product < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :category, :company, :name
  validates_format_of :company,
    :with => /^[A-Za-z0-9&\s,\-\.]*$/
  validates_format_of :name,
    :with => /^[A-Za-z0-9&\s,\-\.]*$/
    
  scope :sorted, :order => 'company, name'
  scope :premier, :conditions => { :premier => true }, :order => 'position'
  scope :search, lambda { |term| where("upper(name) LIKE upper(?) or upper(company) LIKE upper(?)", term, term) }
end
