class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @admins = User.with_role :admin
    @editors = User.with_role :editor
  end

  def promote
    if current_user.has_role? :admin
      @user = User.find(params[:id])
      @user.add_role(:admin)
      @user.remove_role(:editor)
      @user.save
      @posts = @user.posts
      render 'index'
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
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
