class HomeController < ApplicationController
  def index
  end

  
  # handle home page photo gallery ajax request
  def get_top
    @timelines = Timeline.find(:all, :order => "follow_count DESC", :limit => 10)
    @photo_side = params[:photoSide];
    puts @timelines
  end
  
end
