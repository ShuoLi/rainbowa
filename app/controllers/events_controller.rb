class EventsController < ApplicationController
  respond_to :html, :json
  
  def create
    # puts params[:event]
    ep = params[:event]
    timeline = Timeline.find(ep[:timeline_id])
    event = timeline.events.build(:time => ep[:time],
                                  :video => ep[:video],
                                  :description => ep[:description])
    event.records.build(:user_id => current_user.id)
    if event.save
      follow(timeline)
      timeline.update_attributes(:last_edit => Time.now)
      redirect_to timeline_path(ep[:timeline_id])
    else
      flash[:error] = "new event error."
    end
  end

  def destroy
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    @event.records.create(:user_id => current_user.id)
    follow(@event.timeline)
    @event.timeline.update_attributes(:last_edit => Time.now)
    respond_with @event
  end

  def index
  end

  def show
  end
  
end
