class TopController < ApplicationController
  require "bcrypt"

  def main
    if session[:login_uid]
      render "main"
    else
      render "login"
    end
  end

  def login
    uid = params[:uid]
    pass = params[:pass]

    user = User.find_by(uid: uid)

    if user && BCrypt::Password.new(user.pass) == pass
      session[:login_uid] = uid
      redirect_to root_path
    else
      render "error", status: 422
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
