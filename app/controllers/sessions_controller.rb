class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:remember_token] = user.remember_token
      else
        cookies[:remember_token] = user.remember_token
      end
      redirect_to root_url
    else
      if user 
        message = I18n.t('sessions.create.wrong_password')
      else
        message = I18n.t('sessions.create.no_user')
      end
      flash.now.alert = message
      render action: 'new'
    end
  end

  def destroy
    cookies[:remember_token] = nil
    redirect_to root_url
  end
end
