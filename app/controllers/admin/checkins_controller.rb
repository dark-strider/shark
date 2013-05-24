# encoding: utf-8
module Admin
  class CheckinsController < BaseController

    def create
      @checkin = Checkin.new(params[:checkin], as: :admin)
      if @checkin.save
        redirect_to [:admin, @checkin], notice: 'Отметка добавлена.'
      else
        render :new
      end
    end

    def update
      if @checkin.update_attributes(params[:checkin], as: :admin)
        redirect_to [:admin, @checkin], notice: 'Отметка обновлена.'
      else
        render :edit
      end
    end

    def destroy
      @checkin.destroy
      redirect_to [:admin, :checkins], notice: 'Отметка удалена.'
    end
  end
end