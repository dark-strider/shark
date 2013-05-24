# encoding: utf-8
module Admin
  class UsersController < BaseController

    def update
      if @user.update_attributes(params[:user], as: :admin)
        redirect_to [:admin, @user], notice: 'Пользователь обновлен.'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to [:admin, :users], notice: 'Пользователь удален.'
    end
  end
end