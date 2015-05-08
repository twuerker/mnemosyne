# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id, :status

  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"

  validates :user_id, :presence => true
  validates :friend_id, :presence => true

  validates :status, inclusion: {in: %w(oneway mutual), message: "%{value} is not valid status"}
end
