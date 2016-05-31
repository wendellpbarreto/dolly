# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  has_many :users
  has_many :permission_role
  has_many :permissions, through: :permission_role
  validates :name, presence: true
end
