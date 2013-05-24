# encoding: utf-8
class CheckinsController < ApplicationController
  # before_filter :spot

  def create
    @spot = Spot.find(params[:checkin][:spot_id])

    unless @spot.checked_by?(current_user)
      if @spot.code == params[:qrcode]
        @checkin = Checkin.new
        @checkin.user_id = current_user.id
        @checkin.spot_id = params[:checkin][:spot_id]

        if @checkin.save
          flash[:notice] = 'Отлично, теперь поделитесь ссылкой с вашими друзьями в социальных сетях.'
        else
          flash[:alert] = 'Что-то пошло не так, попробуйте еще раз.'
        end
      else
        flash[:alert] = 'Вы ввели неверный QR-код, попробуйте еще раз.'
      end
    else
      flash[:alert] = 'Вы уже отметили это место ранее.'
    end
    redirect_to [@spot]
  end

  def update
    # unless @checkin.socials.include?(share)
    #   checkin.socials << share
    # else
    #   flash[:alert] = 'Вы уже отправляли эту ссылку.'
    # end

    if @checkin.update_attributes(params[:checkin])
      flash[:notice] = 'Продолжайте в том же духе.'
    else
      flash[:alert] = 'Что-то пошло не так, попробуйте еще раз.'
    end
    redirect_to [@checkin.spot]
  end

  # def destroy
  #   @spot = @checkin.spot
  #   @checkin.destroy
  #   redirect_to @spot, notice: 'Отметка удалена.'
  # end

# private

#   def spot
#   end
end