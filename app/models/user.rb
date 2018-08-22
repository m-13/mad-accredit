# frozen_string_literal: true

#:nodoc:
class User < MadappDbBase
  self.table_name = 'User'

  has_many :user_credits_history
  has_many :requests
  has_many :user_groups
  has_many :groups, through: :user_groups
  include MadappAuthenticable
end