# == Schema Information
#
# Table name: user_reactions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  reaction_id :integer
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserReaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :reaction
end
