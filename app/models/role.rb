class Role < ActiveRecord::Base
  has_many :users
  has_many :permission_role
  has_many :permissions, through: :permission_role
  validates :name, presence: true
end
