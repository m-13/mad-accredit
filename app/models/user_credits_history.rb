class UserCreditsHistory < MadappDbBase
  self.table_name = 'User_Credit_Archive'

  belongs_to :user
end