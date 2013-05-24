# encoding: utf-8
module Admin
  class SocialsController < BaseController

    def create
      @social = Social.new(params[:social], as: :admin)
      if @social.save
        redirect_to [:admin, @social], notice: 'Социальная сеть добавлена.'
      else
        render :new
      end
    end

    def update
      if @social.update_attributes(params[:social], as: :admin)
        redirect_to [:admin, @social], notice: 'Социальная сеть обновлена.'
      else
        render :edit
      end
    end

    def destroy
      @social.destroy
      redirect_to [:admin, :socials], notice: 'Социальная сеть удалена.'
    end
  end
end