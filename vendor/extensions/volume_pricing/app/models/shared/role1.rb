class Role1 < ActiveRecord::Base
  has_and_belongs_to_many :users

  ADMIN = 1
  USER = 2
  CHANNEL = 3
  SALES_REP = 4

end
