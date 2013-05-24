# encoding: utf-8
module Admin
  class NewsController < BaseController

    def create
      @news = current_user.news.new(params[:news], as: :admin)
      if @news.save
        redirect_to [:admin, @news], notice: 'Новость добавлена.'
      else
        render :new
      end
    end

    def update
      if @news.update_attributes(params[:news], as: :admin)
        redirect_to [:admin, @news], notice: 'Новость обновлена.'
      else
        render :edit
      end
    end

    def destroy
      @news.destroy
      redirect_to [:admin, :news_index], notice: 'Новость удалена.'
    end
  end
end