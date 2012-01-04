class TimelinesController < ApplicationController
  respond_to :html, :json
  
  def create
    @timeline = Timeline.create(params[:timeline])
    follow(timeline)
    redirect_to timeline_path(@timeline)
  end

  def destroy
    if current_user.admin?
      @timeline = Timeline.find(params[:id])
      @timeline.destroy
      redirect_to timelines_path
    end
  end
  
  def edit
    if current_user
      @timeline = Timeline.find(params[:id])
      @event = Event.new
    else
      redirect_to root_path
    end
  end

  def update
    @timeline = Timeline.find(params[:id])
    @timeline.update_attributes(params[:timeline])
    respond_with @timeline
  end

  def index
    @timeline = Timeline.all
  end

  def show
    @timeline = Timeline.find(params[:id])
  end

  def new
    @timeline = Timeline.new
  end
  
end
