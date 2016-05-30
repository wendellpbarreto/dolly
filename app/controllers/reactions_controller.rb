class ReactionsController < MainController
  before_filter :get_koala_graph

  def index
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
