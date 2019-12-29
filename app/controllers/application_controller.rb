class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # ログイン、ログアウト処理意外のアクションを実行する前に認証処理を挿入する
  before_action :authenticate, except: [:login, :logout]

  # ログイン済みであるかどうか認証する
  def authenticate()
    @auth_account= Account.find_by(id: session[:account_id])
    if (@auth_account != nil)
        true
    else
        head :unauthorized
    end
  end
end
