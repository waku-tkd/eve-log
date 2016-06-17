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
    #params[:id] message id
    @micropost = Micropost.find(params[:id])
#    @microposts = Micropost.order("created_at desc")
  end


  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Success to edit event details"
      redirect_to @micropost
    else
      render 'edit'
    end
  end

  private
  def micropost_params
    params.require(:micropost).permit(:title, :location, :headcount, :budget, :url, :comment)
  end
end
