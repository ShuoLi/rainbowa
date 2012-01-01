class TimelinesController < ApplicationController
  respond_to :html, :json
  
  def create
    @timeline = Timeline.create(params[:timeline])
    follow = @timeline.follows.find_by_user_id(current_user.id)
    unless follow
      @timeline.follows.create(:user_id => current_user.id)
      increase_follow_count(@timeline)
    end
    redirect_to timeline_path(@timeline)
  end

  def destroy
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
  
  private
    def increase_follow_count(timeline)
      follow_count = timeline.follow_count;
      timeline.update_attributes(:follow_count => follow_count+1)
    end
end
