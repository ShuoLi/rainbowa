module FollowsHelper
  def if_follow?(tl_id)
    if current_user.follows.find_by_timeline_id(tl_id)
      return true
    else
      return false
    end
  end
end
