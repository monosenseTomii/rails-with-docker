class SessionsController < ApplicationController
  before_action :require_login!, only: [:destroy]

  # ログイン画面
  def new
  end

  # ログイン検証とセッションの生成
  def create
    user = User.find_by!(mail: params[:mail]) # 入力されたメールアドレスからユーザーを検索

    if user.authenticate(params[:password])   # パスワードを検証
      session[:user_mail] = user.mail           # 検証OKなら、セッションにメールアドレスを保存
      redirect_to users_path                    # 一覧画面へ遷移
    else
      render 'new'                              # パスワード検証NGなら、ログイン画面を再表示
    end
  end

  # ログアウト（セッションの破棄）
  def destroy
    session[:user_mail] = nil                 # セッション情報を削除
    redirect_to login_path                    # ログイン画面へ遷移
  end
end