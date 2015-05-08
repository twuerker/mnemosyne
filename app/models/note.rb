# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  attr_accessible :id, :user_id, :content
  belongs_to :user
  validates :user_id, :presence => true

  has_many :participants, :class_name => 'User'
end
