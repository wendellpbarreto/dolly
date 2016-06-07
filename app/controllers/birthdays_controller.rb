class BirthdaysController < ApplicationController
  def index
  	@friends = current_user.friends.to_a
  end

  def new
  	@birthday_message = Message.new
  end

  def scheduled
    @scheduled_messages = current_user.messages.where(type: 'birthday').to_a
  end

  def saved
    @saved_messages = current_user.messages.where(type: 'birthday').to_a
  end

  def create
  	friend = current_user.friends.first
    if friend == nil
      friend = current_user.friends.build
      friend.name = "My Friend Name"
      friend.save
    end

    birthday_message = current_user.messages.build friend: friend
    birthday_message.content = params[:birthday_message][:content]
    birthday_message.when = friend.birthday
    birthday_message.type = "birthday"

    if birthday_message.save
    end
    redirect_to birthdays_path
  end
end
