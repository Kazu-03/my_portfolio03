class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    @blog.images.new
    @search_results = Unsplash::Photo.search("s")
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

  def search
    if params [:keyword]
    @ogp = photo = Unsplash::Photo.find("tAKXap853rY")
    end
  end

  private

  def set_blog
    @blog =Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :detatil, images_attributes:[:src])
  end

  def slack_txt_template post
    "[投稿]しました | #{Rails.env}
    title: #{post.title}
    detatil: #{post.detatil}"
  end
end
