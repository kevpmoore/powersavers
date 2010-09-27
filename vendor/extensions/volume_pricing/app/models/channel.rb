class Channel < ActiveRecord::Base
  belongs_to :user

  # validates_presence_of :variant
  # validates_presence_of :amount
  
end
