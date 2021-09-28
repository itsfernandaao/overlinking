class OverlinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trail

  def new
    @overlink = @trail.overlinks.build
  end

  def create
    @overlink = @trail.overlinks.build(overlink_params)

    if @overlink.save
      redirect_to trails_path
    else
      render :new
    end
  end

  private

    def set_trail
      @trail = current_user.trails.find(params[:trail_id])
    end

    def overlink_params
      params.require(:overlink).permit(:title, :url, :description)
    end
end
