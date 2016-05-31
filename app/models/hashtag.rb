class Hashtag < ActiveRecord::Base
	has_many :hashtag_reaction
	has_many :reactions, through: :hashtag_reaction

	has_many :friend_hashtag
  	has_many :friends, through: :friend_hashtag
end
