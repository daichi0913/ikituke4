
class TweetsController < ApplicationController
  def index
    @user = current_user
    @tweets = Tweet.page(params[:page]).per(20)
  end

  def new
  end

  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  def show_tweets
    @user = current_user
    @tweets = Tweet.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

  private
  def tweet_params
    params.permit(:text)
  end

end
