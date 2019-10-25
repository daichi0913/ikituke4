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
end

