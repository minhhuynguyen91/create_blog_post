class BlogsController < ApplicationController
  before_action :set_blog, :only => [:show, :new, :edit]
  before_action :require_signin
  
  def index
    @blogs = Blog.all
  end

  def new
  end

  def create
    @blog = Blog.new blog_params
    if @blog.save
      flash[:success] = "Blog created successfully"
      redirect_to blogs_path
    else
      flash[:error] = "Blog cannot be created"
      render 'new'
    end
  end

  def show
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

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
