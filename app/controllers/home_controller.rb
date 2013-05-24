# encoding: utf-8
class HomeController < ApplicationController
  skip_authorization_check

  def index
    @markers = select_actual_spots
  end

private

  def select_actual_spots
    all = Spot.actual
    json = all.to_gmaps4rails do |spot, marker|
      # icon
      spot.status == 'now' ? icon = 'now' : icon = 'soon'
      
      if spot.energetic.name == 'Shark'
        icon += '_shark'
      elsif spot.energetic.name == 'M-150'
        icon += '_m150'
      end
      icon += '_checked' if spot.checked_by?(current_user)

      # marker
      marker.infowindow render_to_string(
        partial: '/home/infobox',
        locals: { spot: spot }
      )
      marker.picture({ picture: "/assets/map/#{icon}.png", width: 32, height: 37 })
    end
  end
end