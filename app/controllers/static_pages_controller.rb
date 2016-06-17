class StaticPagesController < ApplicationController

  def home
    @micropost = current_user.microposts.build if logged_in?
    @microposts = Micropost.order("created_at desc")
  end

  private
  def Micropost_params
    params.require(:micropost).permit(:title, :location, :headcount, :budget, :url, :comment)
  end
end
