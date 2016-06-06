class PostsController < AdminController

  def index
    @posts = current_user.posts
  end

  def new
    @posts = current_user.posts

    @post = Post.new
  end

  def create
    friend = current_user.friends.first
    if friend == nil
      friend = current_user.friends.build
      friend.name = "My Friend Name"
      friend.save
    end


    post = current_user.posts.build friend: friend
    post.content = params[:post][:content]
    post.when = params[:post][:when]

    if post.save
      # @graph.put_wall_post(post.content)
    end
    redirect_to posts_path
  end
end
