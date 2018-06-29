module MadappAuthenticable
  extend ActiveSupport::Concern

  def authenticate(password)
    hash = self.password_hash.gsub(/^\$2y/, '$2a')
    if ::BCrypt::Password.new(hash) == password
      self
    else
      false
    end    
  end
end