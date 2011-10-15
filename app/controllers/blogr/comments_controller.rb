module Blogr
  class CommentsController < BlogrController
    unloadable
    before_filter :get_post

    def create
      @comment = @post.comments.new(params[:blogr_comment])
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        redirect_to blogr_post_path(@post)
        Activity.create :who => @comment.name, :what => "New comment on  #{@post.title}"
      else
        flash[:notice] = 'Either your name or the message was invalid.'
        redirect_to blogr_post_path(@post)
      end
    end

  private

    def get_post
      @post = Post.find(params[:post_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to blogr_posts_path
    end

  end
end