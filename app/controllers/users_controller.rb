class UsersController < ApplicationController
  def logout
  end

  def show
    @user = current_user
    @blogs = Blog.all
  end

end
