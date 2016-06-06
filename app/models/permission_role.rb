# == Schema Information
#
# Table name: permission_roles
#
#  id            :integer          not null, primary key
#  permission_id :integer
#  role_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PermissionRole < ActiveRecord::Base
  belongs_to :permission
  belongs_to :role
end
