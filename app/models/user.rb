# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#  fb_id                  :string
#  fb_token               :string
#

class User < ActiveRecord::Base

  has_many :friends
  has_many :posts, :through => :friends
  has_many :messages, :through => :friends

  has_many :user_reaction
  has_many :reactions, through: :user_reaction

  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :role, presence: true

  def facebook_api
    FacebookApi.new(self.fb_token)
  end

  def update_friends
    graph_friends = facebook_api.get_user_friends
    graph_friends.each do |graph_friend|
      friend = Friend.find_or_create_by(user: self, fb_id: graph_friend["id"]) do |friend|
        friend.name = graph_friend["name"]
      end
    end
  end
end
