class PagesController < ApplicationController
  skip_authorization_check

  def show
    @page = Page.find_by(permalink: params[:id])
  end
end