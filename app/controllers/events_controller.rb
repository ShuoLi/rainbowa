class EventsController < ApplicationController
  def create
    # puts params[:event]
    ep = params[:event]
    event = Timeline.find(ep[:timeline_id]).events.build(:time => ep[:time],
                                                :video => ep[:video],
                                                :description => ep[:description])
    if event.save
      redirect_to timeline_path(ep[:timeline_id])
    else
      flash[:error] = "new event error."
    end
  end

  def destroy
  end

  def update
  end

  def index
  end

  def show
  end

end
