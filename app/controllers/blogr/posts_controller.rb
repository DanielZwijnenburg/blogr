module Blogr
  class PostsController < BlogrController
    unloadable

    def index
      @posts = Post.published
    end

    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
      @comments = @post.comments
    end

  end
end