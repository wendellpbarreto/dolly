class MessagesController < MainController
  before_filter :get_koala_graph

  def friends
    @profile = @graph.get_object("me")
    @friends = @graph.get_connections("me", "friends")
  end

  def index
    @messages = current_user.messages
  end

  def new
    @message = Message.new
  end

  def create
    friend = current_user.friends.first
    if friend == nil
      friend = current_user.friends.build
      friend.name = "My Friend Name"
      friend.save
    end
    action = Action.all.first
    if action == nil
      action = Action.new
      action.title = "action"
      action.description = "My action"
      action.save
    end


    message = current_user.messages.build friend: friend, action: action
    message.content = params[:message][:content]

    if message.save
      @graph.put_wall_post(message.content)
    end
    redirect_to messages_path
  end

  private

  def get_koala_graph
    @graph = Koala::Facebook::API.new(current_user.fb_token, ENV['FB_SECRET_KEY'].to_s)
  end
end
