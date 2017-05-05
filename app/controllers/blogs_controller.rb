class BlogsController < ApplicationController
  before_action :set_blog, :only => [:show, :edit]
  before_action :set_user, :only => [:show, :edit, :create]
  before_action :require_signin, :only => [:new, :create, :edit, :update]
  
  def index
    @blogs = Blog.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = @user.blogs.build blog_params
    if @blog.save
      flash[:success] = "Blog created successfully"
      redirect_to blogs_path
    else
      flash[:error] = @blog.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @comment = Comment.new
    @comments = @blog.comments
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
