class ApplicationController < ActionController::Base
  protect_from_forgery

  # -CanCan-
  check_authorization unless: :devise_controller?
  skip_authorization_check class: 'RedactorRails'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  # -Subdomain-
  before_filter :set_format

private

  def set_format
    if params[:v]
      if params[:v] == 'd'
        cookies.permanent[:view] = { value: 'desktop', domain: :all }
      elsif params[:v] == 'm'
        cookies.permanent[:view] = { value: 'mobile', domain: :all }
      end

      if i_subdomain?
        redirect_to without_i_subdomain
      else
        redirect_to with_i_subdomain
      end

    elsif i_subdomain?
      prepend_view_path 'app/views_mobile'

    elsif cookies[:view] != 'desktop'
      redirect_to with_i_subdomain if cookies[:view] == 'mobile' || mobile_browser?
    end
  end

  def i_subdomain?
    request.subdomains.first == 'i'
  end

  def with_i_subdomain
    request.protocol+'i.'+request.host_with_port+request.path
  end

  def without_i_subdomain
    request.protocol+request.host_with_port.gsub(/^i\./,'')+request.path
  end

  def mobile_browser?
    request.user_agent =~ /iPhone|iPod|Android|webOS|windows ce|Mobile/
  end
end