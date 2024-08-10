class SessionsController < ApplicationController
  def new
    # ログインフォームを表示する
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      puts "ログイン成功"
      session[:user_id] = user.id
      redirect_to root_path
    else
      puts "ログイン失敗"
      flash[:alert] = "メールアドレスまたはパスワードが間違っています"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end
end