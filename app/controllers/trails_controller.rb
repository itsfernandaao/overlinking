class TrailsController < ApplicationController 
  before_action :authenticate_user!

  def index
    @trails = current_user.trails
  end

  def new 
    @trail = current_user.trails.build
  end

  def create
    @trail = current_user.trails.build(trail_params)

    if @trail.save
      redirect_to trails_path
    else
      render :new
    end
  end

  def set_public
    @trail = current_user.trails.find(params[:trail_id])
    @trail.update(public: true)
    redirect_to trails_path
  end

  def set_private
    @trail = current_user.trails.find(params[:trail_id])
    @trail.update(public: false)
    redirect_to trails_path
  end

  private

    def trail_params 
      params.require(:trail).permit(:name)
    end
end
