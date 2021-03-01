class UsersController < ApplicationController
  def logout
  end

  def show
    @user = current_user
    @blogs = Blog.find(params[:id])
    @blogs = Blog.all
  end

end
