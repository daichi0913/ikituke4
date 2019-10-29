class TopController < ApplicationController

  before_action :manji, except: :index

  def index
  end

  def new
  end

  def create
    post.create(post_params)
  end

  private
  def post_params
    params.permit(:name, :text)
  end

  def manji
    redirect_to action: :index unless user_signed_in?
  end

  def users_tweets
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end
end

