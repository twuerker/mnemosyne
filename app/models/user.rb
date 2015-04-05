# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  email      :string
#

class User < ActiveRecord::Base
  attr_accessible :user_id, :name, :username, :email

  validates :name, :presence => true
  validates :username, :presence => true
  validates :email, :presence => true

  has_many :notes
end
