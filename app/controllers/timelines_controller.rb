class TimelinesController < ApplicationController
  def create
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
  end

end
