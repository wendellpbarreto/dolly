class MessagesController < AdminController

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
    message.when = params[:message][:when]

    if message.save
    end
    redirect_to messages_path
  end
end
