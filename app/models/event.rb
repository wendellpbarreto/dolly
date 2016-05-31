# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  when         :datetime
#  actable_id   :integer
#  actable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Event < ActiveRecord::Base
  actable

  validates :when, presence: true
end
