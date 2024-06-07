class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def profile
    @user = current_user
  end
end
