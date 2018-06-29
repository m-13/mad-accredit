class User < MadappDbBase
  self.table_name = 'User'

  has_many :user_credits_history
  has_many :requests
  include MadappAuthenticable
end