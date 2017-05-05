class CommentsController < ApplicationController
  def new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build comment_params
    if @comment.save
      flash[:success] = "Comment created successfully"
      redirect_to blog_path(@blog)
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      render blog_path(@blog)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
