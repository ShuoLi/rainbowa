class FollowsController < ApplicationController
  def create
    unless current_user
      return
    end
    timeline = Timeline.find(params[:timeline_id])
    follow(timeline)
    render :nothing => true
  end

  def destroy
    current_user.follows.find_by_timeline_id(params[:timeline_id]).destroy
  end

end
