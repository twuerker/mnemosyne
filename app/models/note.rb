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
  attr_accessible :note_id, :user_id, :content
  belongs_to :user
  validates :user_id, :presence => true
  mount_uploader :picture, PictureUploader
end
