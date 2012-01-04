class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def increase_follow_count(timeline)
    follow_count = timeline.follow_count;
    timeline.update_attributes(:follow_count => follow_count+1)
  end

  # follow timeline when edit or new a event.
  def follow(timeline)
    follow = timeline.follows.find_by_user_id(current_user.id)
    unless follow
      timeline.follows.create(:user_id => current_user.id)
      increase_follow_count(timeline)
    end
  end

end
