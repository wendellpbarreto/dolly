class User < ActiveRecord::Base

  has_many :friends
  has_many :messages

  has_many :user_reaction
  has_many :reactions, through: :user_reaction

  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :role, presence: true
end
