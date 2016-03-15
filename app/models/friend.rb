class Friend < ActiveRecord::Base
  has_many :messages
  belongs_to :user

  validates :user, presence: true
end
