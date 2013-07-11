class QuoteRequest < ActiveRecord::Base
  validates_presence_of :name, :company, :phone
  
  default_scope -> { order('date desc') }
end
