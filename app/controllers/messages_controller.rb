class MessagesController < AdminController

  def index
    @messages = current_user.messages
  end

  def new
    @messages = current_user.messages

    @message = Message.new
  end

  def create
    friend = current_user.friends.first
    if friend == nil
      friend = current_user.friends.build
      friend.name = "My Friend Name"
      friend.save
    end

    message = current_user.messages.build friend: friend
    message.content = params[:message][:content]
    message.when = params[:message][:when]

    if message.save
    end
    redirect_to messages_path
  end
end
