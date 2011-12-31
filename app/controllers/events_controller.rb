class EventsController < ApplicationController
  respond_to :html, :json
  
  def create
    # puts params[:event]
    ep = params[:event]
    event = Timeline.find(ep[:timeline_id]).events.build(:time => ep[:time],
                                                :video => ep[:video],
                                                :description => ep[:description])
    event.records.build(:user_id => current_user.id)
    if event.save
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
    respond_with @event
  end

  def index
  end

  def show
  end

end
