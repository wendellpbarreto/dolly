class ReactionsController < AdminController
  before_filter :get_koala_graph

  def index
    @reactions = Reaction.all.to_a
    @friends = Friend.from_user(current_user).to_a
    @user_reactions = current_user.reactions.to_a
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
