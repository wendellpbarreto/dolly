class Friend < ActiveRecord::Base
  has_many :messages
  belongs_to :user

  has_many :friend_reaction
  has_many :reactions, through: :friend_reaction

  has_many :friend_hashtag
  has_many :hashtags, through: :friend_hashtag

  validates :user, presence: true
end
