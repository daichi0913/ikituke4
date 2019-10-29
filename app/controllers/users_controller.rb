class UsersController < ApplicationController

  def users_tweets
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end


end
