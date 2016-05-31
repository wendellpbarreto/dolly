class Reaction < ActiveRecord::Base
	has_many :hashtag_reaction
  	has_many :hashtags, through: :hashtag_reaction

  	has_many :friend_reaction
  	has_many :friends, through: :friend_reaction

    has_many :user_reaction
    has_many :users, through: :user_reaction


    scope :from_user, ->(id){where(:user_id => id)}

  	def get_hashtags_formatted
    	hashtags_formatted = ""
    	self.hashtags.each_with_index do |htag, index|
    		if index == self.hashtags.length - 1
	    		hashtags_formatted += htag.name 
	    	else
	    		hashtags_formatted += htag.name + ", "
	    	end
	    end

	    hashtags_formatted
  	end
end
