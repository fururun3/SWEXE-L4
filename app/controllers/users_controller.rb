class UsersController < ApplicationController
  require "bcrypt"

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # 入力された uid と pass を受け取る
    uid = params[:user][:uid]
    pass = params[:user][:pass]

    # パスワードをハッシュ化して User オブジェクトを作成
    u = User.new(uid: uid, pass: BCrypt::Password.create(pass))

    # 保存
    if u.save
      redirect_to users_path, notice: "ユーザーを作成しました"
    else
      render :new, status: 422
    end
  end
end
