# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtag < ActiveRecord::Base
	has_many :hashtag_reactions
	has_many :reactions, through: :hashtag_reactions

	has_many :friend_hashtags
  has_many :friends, through: :friend_hashtags
end
