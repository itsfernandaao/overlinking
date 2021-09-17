class TrailsController < ApplicationController 
  before_action :authenticate_user!

  def index
    @trails = Trail.all
  end

  def new 
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)

    if @trail.save
      redirect_to trails_path
    else
      render :new
    end
  end

  private

    def trail_params 
      params.require(:trail).permit(:name)
    end
end
