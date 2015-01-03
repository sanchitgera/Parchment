class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @admins = User.with_role :admin
    @editors = User.with_role :editor
  end

  def index
    begin
      @user = User.find(params[:id])
      @posts = @user.posts
    rescue ActiveRecord::RecordNotFound
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end
end
