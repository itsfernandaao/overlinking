class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @trails = Trail.where(public: true)
  end
end
