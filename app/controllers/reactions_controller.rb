class ReactionsController < AdminController
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

  def trigger
    reaction = Reaction.find(params[:reaction].to_i)
    user_reaction = UserReaction.where(user: current_user, reaction: reaction).first
    if user_reaction
      user_reaction.destroy
    else
      UserReaction.create(user: current_user, reaction: reaction)
    end

    respond_to do |format|
      format.json { head :ok }
    end
  end
end
