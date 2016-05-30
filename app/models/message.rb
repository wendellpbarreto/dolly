class Message < ActiveRecord::Base
  acts_as :event

  belongs_to :action
  belongs_to :user
  belongs_to :friend

  validates :action, :user, :friend, presence: true
end
