# encoding: utf-8
class PhotosController < ApplicationController
  authorize_resource
  load_resource only: :destroy

  def create
    file = AppSpecificStringIO.new(params[:qqfile], request.raw_post)
    @photo = Photo.new({ user_id: current_user, spot_id: params[:spot_id], image: file }, as: :seller)

    if @photo.save
      render json: { success: true }
    else
      render json: @photo.errors.to_json
    end
  end

  def destroy
    @photo.destroy
    redirect_to :back, notice: 'Фото удалено.'
  end
end