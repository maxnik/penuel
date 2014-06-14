class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
    if cookies[:remember_token]
      if @current_user.nil?
        @current_user = User.find_by_remember_token(cookies[:remember_token])
        I18n.locale = @current_user.locale unless @current_user.nil?
      end
      @current_user 
    end
  end
  helper_method :current_user

  def authorize
    if current_user.nil?
      flash[:alert] = I18n.t('sessions.new.must_be_logged_in')
      redirect_to login_url
    end
  end
end
