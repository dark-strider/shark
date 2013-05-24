# encoding: utf-8
module Admin
  class PagesController < BaseController
    # skip_load_resource except: [:index, :new, :create]
    # before_filter :find_by_permalink, except: [:index, :new, :create]

    def create
      @page = Page.new(params[:page], as: :admin)
      if @page.save
        redirect_to [:admin, @page], notice: 'Страница добавлена.'
      else
        render :new
      end
    end

    def update
      if @page.update_attributes(params[:page], as: :admin)
        redirect_to [:admin, @page], notice: 'Страница обновлена.'
      else
        render :edit
      end
    end

    def destroy
      @page.destroy
      redirect_to [:admin, :pages], notice: 'Страница удалена.'
    end

  # private

  #   def find_by_permalink
  #     @page = Page.where(permalink: params[:id]).first
  #   end
  end
end