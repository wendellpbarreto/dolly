class MainController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @messages = current_user.messages
  end
end
