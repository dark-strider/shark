# encoding: utf-8
module Admin
  class EnergeticsController < BaseController

    def create
      @energetic = Energetic.new(params[:energetic], as: :admin)
      if @energetic.save
        redirect_to [:admin, @energetic], notice: 'Энергетик добавлен.'
      else
        render :new
      end
    end

    def update
      if @energetic.update_attributes(params[:energetic], as: :admin)
        redirect_to [:admin, @energetic], notice: 'Энергетик обновлен.'
      else
        render :edit
      end
    end

    def destroy
      @energetic.destroy
      redirect_to [:admin, :energetics], notice: 'Энергетик удален.'
    end
  end
end