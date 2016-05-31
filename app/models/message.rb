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

  belongs_to :action
  belongs_to :user
  belongs_to :friend

  validates :action, :user, :friend, presence: true
end
