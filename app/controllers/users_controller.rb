class UsersController < ApplicationController
  include ActionView::Helpers::DateHelper
  
  def show
    # remove later just for change database
    # Record.find(:all).each do |r|
    #     r.update_attributes(:timeline_id => r.event.timeline.id)
    #   end
    
    @user = User.find(params[:id])
    @follows = @user.follows.find(:all)
    @TL_f = Array.new
    @follows.each do |f|
      @TL_f << f.timeline
    end 
    @TL_c = Array.new
    @TL_c.sort! { |a,b| a.last_edit <=> b.last_edit } # order them by :last_edit
    @TL_f.each do |t|
      if t.last_edit - current_user.last_login > 0
        @TL_c << t
      end
    end
    @data_array = Array.new # array of timeline data
    @TL_c.each do |t|
      tl = Hash.new # :id and :data
      tl["id"] = t.id
      tl["data"] = Array.new
      # puts event data into tl["data"] array
      # title: eventTitle, video: videoLink, who: userName, when: date
      records = t.records.all#.find(:all, :order => "created_at DESC", :limit => 5)
      records.each do |r|
        event = r.event
        history = {"title" => event.title, 
                  "video" => event.video, 
                  "who" => r.user.name.split(" ").first,
                  "when" => time_ago_in_words(r.created_at, false) + ' ago'}
        tl["data"] << history
      end
      @data_array << tl
    end
  end

  def index
    if current_user.admin?
      @users = User.all
    end
  end

end
