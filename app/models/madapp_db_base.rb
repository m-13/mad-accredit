class MadappDbBase < ActiveRecord::Base  
  self.abstract_class = true
  establish_connection MADAPP_DB
end