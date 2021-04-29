class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  def show

  end

  private
  def move_to_root
    redirect_to root_path unless current_user
  end
end
