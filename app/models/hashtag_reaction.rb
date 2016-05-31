class HashtagReaction < ActiveRecord::Base
  belongs_to :hashtag
  belongs_to :reaction
end
