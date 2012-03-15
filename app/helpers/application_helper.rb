# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def submitLabel(record)
    record.new_record? ? 'Add' : 'Update'
  end
  
end
