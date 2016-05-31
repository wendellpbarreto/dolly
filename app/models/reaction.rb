# == Schema Information
#
# Table name: reactions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reaction < ActiveRecord::Base
	  has_many :hashtag_reactions
  	has_many :hashtags, through: :hashtag_reactions

  	has_many :friend_reactions
  	has_many :friends, through: :friend_reactions

    has_many :user_reactions
    has_many :users, through: :user_reactions


    scope :from_user, ->(id){ joins(:user_reactions).where(user_reactions: {:user_id => id})}

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
