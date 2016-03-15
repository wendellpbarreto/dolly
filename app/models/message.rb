class Message < ActiveRecord::Base
  belongs_to :action
  belongs_to :user
  belongs_to :friend

  validates :action, :user, :friend, presence: true
end
