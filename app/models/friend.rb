# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fb_id      :string
#

class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :messages

  has_many :friend_reaction
  has_many :reactions, through: :friend_reaction

  has_many :hashtags, through: :reactions

  validates :user, presence: true


  scope :from_user, ->(id){eager_load(:reactions, :hashtags).where(:user_id => id)}

end
