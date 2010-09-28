class Channel < ActiveRecord::Base
  belongs_to :user
  has_many :volume_prices, :primary_key => :user_id, :foreign_key => :user_id, :dependent => :destroy

   validates_presence_of :name

#   validate :must_be_only_one_channel_per_user, :on => :create

  def must_be_only_one_channel_per_user
    errors.add(:user_id, "There can only be one channel associated with a user, this user already has a channel.") if Channel.all.map(&:user_id).include?(self[:user_id])
  end
end
