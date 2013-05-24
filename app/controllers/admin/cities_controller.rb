# encoding: utf-8
module Admin
  class CitiesController < BaseController

    def create
      @city = City.new(params[:city], as: :admin)
      if @city.save
        redirect_to [:admin, @city], notice: 'Город добавлен.'
      else
        render :new
      end
    end

    def update
      if @city.update_attributes(params[:city], as: :admin)
        redirect_to [:admin, @city], notice: 'Город обновлен.'
      else
        render :edit
      end
    end

    def destroy
      @city.destroy
      redirect_to [:admin, :cities], notice: 'Город удален.'
    end
  end
end