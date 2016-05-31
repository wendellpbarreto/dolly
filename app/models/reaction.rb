class Reaction < ActiveRecord::Base
	has_many :hashtag_reaction
  	has_many :hashtags, through: :hashtag_reaction

  	has_many :friend_reaction
  	has_many :friends, through: :friend_reaction
end
