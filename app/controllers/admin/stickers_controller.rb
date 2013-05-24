# encoding: utf-8
module Admin
  class StickersController < BaseController

    def create
      @sticker = Sticker.new(params[:sticker], as: :admin)
      if @sticker.save
        redirect_to [:admin, @sticker], notice: 'Стикер добавлен.'
      else
        render :new
      end
    end

    def update
      if @sticker.update_attributes(params[:sticker], as: :admin)
        redirect_to [:admin, @sticker], notice: 'Стикер обновлен.'
      else
        render :edit
      end
    end

    def destroy
      @sticker.destroy
      redirect_to [:admin, :stickers], notice: 'Стикер удален.'
    end
  end
end