class ReactionsController < MainController
  before_filter :get_koala_graph

  def index
    @reactions = Reaction.from_user(current_user)
    @friends = Friend.from_user(current_user)
    @tab_icons = ["fa-thumbs-up", "fa-heart", "fa-smile-o", "fa-hand-lizard-o", "fa-frown-o", "fa-meh-o"]
  end

  def new
  end

  def create

  end

  private

  def get_koala_graph
    @graph = Koala::Facebook::API.new(current_user.fb_token, ENV['FB_SECRET_KEY'].to_s)
  end
end
