class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    @blog.images.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to root_path, notice: '記事が投稿されました。'
    else
      flash.now[:alert]= '必須項目を入力してください。'
      render :new
    end
  end

  def edit
  end

  def update
    if blog.update(blog_params)
      redirect_to blog_path(blog.id), notice: '記事が編集されました。'
    else
      flash.now[:alert]= '必須項目を入力してください。'
      render :edit
    end
  end

  def show
  end
  
  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to root_path
  end

  private

  def set_blog
    @blog =Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :detatil, images_attributes:[:src])
  end
end
