class Event < ActiveRecord::Base
  actable

  validates :when, presence: true
end
