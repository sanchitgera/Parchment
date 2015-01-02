class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @users = User.all
  end
end
