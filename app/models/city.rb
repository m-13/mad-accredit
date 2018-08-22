# frozen_string_literal: true

#:nodoc:
class City < MadappDbBase
  self.table_name = 'User'

  has_many :users
end