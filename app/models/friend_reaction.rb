# == Schema Information
#
# Table name: friend_reactions
#
#  id          :integer          not null, primary key
#  friend_id   :integer
#  reaction_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FriendReaction < ActiveRecord::Base
  belongs_to :reaction
end
