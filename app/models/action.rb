# == Schema Information
#
# Table name: actions
#
#  id          :integer          not null, primary key
#  title       :string           default(""), not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Action < ActiveRecord::Base
  has_many :messages
end
