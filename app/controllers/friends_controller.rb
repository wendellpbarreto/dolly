class FriendsController < ApplicationController
  ##Collection
  def update_friends
    @profile = @graph.get_object("me")
    @friends = @graph.get_connections("me", "taggable_friends")
  end

  def index
  end


  ##Member
  def messages
  end

  def liked_posts
  end

  private

  def set_friend
  end
end
