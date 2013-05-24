# encoding: utf-8
class SpotsController < ApplicationController
  load_and_authorize_resource

  def show
    @socials = Social.all
    @photos = @spot.photos
  end
end