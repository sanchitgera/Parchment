class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    if !user_signed_in?
      @title = 'All Posts'
    else
      @title = 'Approved Posts'
    end

    @posts = Post.where(:approved => true).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    opts = post_params
    opts[:user] = current_user
    opts[:categories] = retrieve_categories(opts)
    @post = Post.new(opts)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    opts  = post_params
    opts[:categories] = retrieve_categories(opts)

    if @post.update(opts)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def pending
    @posts = Post.where(:approved => false).order('created_at DESC')
    @title = 'Pending Posts'
    render 'index'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end
  private

  def post_params
    params.require(:post).permit(:title, :body, :categories => [])
  end

  def retrieve_categories(opts)
    cids = opts[:categories]
    categories = []
    cids.reject{|c| c.empty?}.each{|cid| categories.push Category.find cid}
    return categories
  end
end
