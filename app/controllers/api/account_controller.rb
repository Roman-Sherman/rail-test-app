class Api::AccountController < ApplicationController

  # GET /api/account/loginStatus
  def loginStatus
    json_response(true)
  end

  # GET /api/account/loginAccount
  def loginAccount
    @auth_account = AccountService::FindAccount.call(id: session[:account_id])
    render json: {:name => @auth_account.name }
  end

  # POST /api/account/login
  def login
    @account = AccountService::AuthenticateAccount.call(name: params[:username], password: params[:password])

    if(@account)
        session[:account_id] = @account.id
    else
        head :unauthorized
    end
  end

  # POST /api/account/logout
  def logout
    session.delete(:account_id)
  end
end
