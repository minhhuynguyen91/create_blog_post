class CommentsController < ApplicationController
  def new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new comment_params
    if @comment.save
      flash[:success] = "Comment created successfully"
      redirect_to blog_path(@blog)
    else
      flash[:error] = "Comment cannot be created"
      render blog_path(@blog)
    end
  end

  private
    def comment_params
      params.require(:blog).permit(:name, :content)
    end
end
