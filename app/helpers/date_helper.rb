module DateHelper
  
  def format_date field
    self.send(field).strftime('%d/%m/%Y') unless self.send(field).nil?
  end

end