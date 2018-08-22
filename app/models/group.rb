# frozen_string_literal: true

#:nodoc:
class Group < MadappDbBase
  self.table_name = 'Group'

  def self.types
    %w[volunteer fellow strat national executive]
  end
  has_many :user_groups
  has_many :users, through: :user_groups
end