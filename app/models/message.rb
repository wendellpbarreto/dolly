# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :string
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  acts_as :event

  belongs_to :user
  belongs_to :friend

  # validates :user, :friend, presence: true
  validates :friend, presence: true
end
