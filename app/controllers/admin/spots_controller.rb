# encoding: utf-8
module Admin
  class SpotsController < BaseController
    before_filter :select, only: [:new, :edit]
    before_filter :coordinates, only: [:create, :update]

    def show
      @photos = @spot.photos
    end

    def create
      @spot = current_user.spots.new(params[:spot], as: :admin)
      if @spot.save
        redirect_to [:admin, @spot], notice: 'Точка распространения добавлена.'
      else
        select
        render :new
      end
    end

    def update
      if @spot.update_attributes(params[:spot], as: :admin)
        redirect_to [:admin, @spot], notice: 'Точка распространения обновлена.'
      else
        select
        render :edit
      end
    end

    def destroy
      @spot.destroy
      redirect_to [:admin, :spots], notice: 'Точка распространения удалена.'
    end

  private

    def coordinates
      # Полученную строку с координатами преобразовываем в массив из float.
      # Для корректной записи массива Coordinates.
      coordinates = params[:spot][:location_attributes][:coordinates].gsub('[','').gsub(']','').gsub(' ','')
      if coordinates != ''
        params[:spot][:location_attributes][:coordinates] = coordinates.split(',').map{ |s| s.to_f }
      end
    end

    def select
      @energetics = Energetic.all
      @countries = Country.all
      @status = Spot::STATUS
      @cities = City.all

      if action_name == 'new'
        @spot.location ||= Location.new
        @marker ||= []
      else
        @marker = @spot.to_gmaps4rails do |spot, marker|
          marker.picture({ picture: '/assets/map/spot.png', width:32, height:37 })
        end
      end
    end
  end
end
