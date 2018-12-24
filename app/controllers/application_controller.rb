class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  protected

  def check_if_admin
    if signed_in?
      unless current_user.admin?
        flash[:notice] = t('admin_access')
        redirect_to root_path
      end
    else
      authenticate_user!
    end
  end
end
