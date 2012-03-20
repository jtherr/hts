class NewsItem < ActiveRecord::Base
  validates_presence_of :date
  validates_presence_of :description
  
  default_scope :order => 'date desc'
  
  def dateString=(dateString)
    self[:date] = Date.strptime(dateString, "%m/%d/%Y") if !dateString.empty?
  end
  
  def dateString
    self[:date].try(:strftime, "%m/%d/%Y")
  end
  
end
