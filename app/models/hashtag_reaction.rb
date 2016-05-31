# == Schema Information
#
# Table name: hashtag_reactions
#
#  id          :integer          not null, primary key
#  hashtag_id  :integer
#  reaction_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HashtagReaction < ActiveRecord::Base
  belongs_to :hashtag
  belongs_to :reaction
end
