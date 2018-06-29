class Request < ApplicationRecord
  serialize :data

  belongs_to :template
  belongs_to :user

end
