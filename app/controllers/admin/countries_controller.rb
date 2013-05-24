# encoding: utf-8
module Admin
  class CountriesController < BaseController

    def create
      @country = Country.new(params[:country], as: :admin)
      if @country.save
        redirect_to [:admin, @country], notice: 'Страна добавлена.'
      else
        render :new
      end
    end

    def update
      if @country.update_attributes(params[:country], as: :admin)
        redirect_to [:admin, @country], notice: 'Страна обновлена.'
      else
        render :edit
      end
    end

    def destroy
      @country.destroy
      redirect_to [:admin, :countries], notice: 'Страна удалена.'
    end
  end
end