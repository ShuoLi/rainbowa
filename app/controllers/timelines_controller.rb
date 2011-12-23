class TimelinesController < ApplicationController
  def create
    @timeline = Timeline.create(params[:timeline])
    follow = @timeline.follows.find_by_user_id(current_user.id)
    unless follow
      @timeline.follows.create(:user_id => current_user.id)
    end
    redirect_to timeline_path(@timeline)
  end

  def destroy
  end

  def update
  end

  def index
    @timeline = Timeline.all
  end

  def show
    @timeline = Timeline.find(params[:id])
    @event = Event.new
  end

  def new
    @timeline = Timeline.new
  end
end
