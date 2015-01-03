class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @admins = User.with_role :admin
    @editors = User.with_role :editor
  end
end
