module Admin
  class BaseController < ApplicationController
    layout 'administration'

    before_filter :authenticate_user!
    before_filter :verify_admin
    skip_authorization_check
    load_resource except: :create

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

  private

    def verify_admin
      redirect_to root_url unless current_user.role === 'admin'
    end
  end
end