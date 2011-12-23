class FollowsController < ApplicationController
  def create
    unless current_user
      return
    end
    if current_user.follows.find_by_user_id_and_timeline_id(current_user.id, params[:timeline_id])
      return
    end
    follow = current_user.follows.build(:timeline_id => params[:timeline_id]) 
    follow.save
    render :nothing => true
  end

  def destroy
    current_user.follows.find_by_timeline_id(params[:timeline_id]).destroy
  end

end
