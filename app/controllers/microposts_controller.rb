class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def new
    @micropost = current_user.microposts.new
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "event log created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show
    @microposts = micropost(micropost_params)
  end

  private
  def micropost_params
    params.require(:micropost).permit(:title, :location, :headcount, :budget, :url, :comment)
  end
end
