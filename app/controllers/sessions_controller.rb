class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "ログインしました"
      redirect_to user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'Email/パスワードが違います'
      render 'new'
    end
  end

  def create_test_user
    user = User.find_by(Animeter_id:"test")
    log_in user
    flash[:success] = "ログインしました"
    redirect_to user
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました"
    redirect_to "/"
  end
end
