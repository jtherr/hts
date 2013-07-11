class Product < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :category, :company, :name
  validates_format_of :company,
    :with => /\A[A-Za-z0-9&\s,\-\.]*\Z/
  validates_format_of :name,
    :with => /\A[A-Za-z0-9&\s,\-\.]*\Z/
    
    
  scope :sorted, -> { order('company, name') }
  scope :premier, -> { where(premier: true) }
  scope :search, lambda { |term| where("upper(name) LIKE upper(?) or upper(company) LIKE upper(?)", term, term) }
end
