module Concerns::Findable
  
  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}.uniq
  end 
end
