class Request < ApplicationRecord
  serialize :data

  belongs_to :template
  belongs_to :user

  validates_uniqueness_of :user_id
end
