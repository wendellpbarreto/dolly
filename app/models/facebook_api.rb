class FacebookApi
  attr_accessor :fb_token

  def initialize token
    self.fb_token = token
  end

  def graph
    Koala::Facebook::API.new(fb_token, ENV['FB_SECRET_KEY'].to_s)
  end
  def post_on_user_wall message
    graph.put_wall_post(message)
  end

  def get_user_friends
    friends = []
    result = graph.get_connections("me", "taggable_friends")
    while (result)
      friends += result
      result = result.next_page
    end
    friends
  end
end
