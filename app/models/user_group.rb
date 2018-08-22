# frozen_string_literal: true

#:nodoc:
class UserGroup < MadappDbBase
  self.table_name = 'UserGroup'

  belongs_to :user
  belongs_to :group
end