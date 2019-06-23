module AccountService
  class AuthenticateAccount < ApplicationService
    def initialize(name:, password:)
      @name = name
      @password = password
    end

    def call
      @account = Account.find_by(name: name)
      if (@account && @account.authenticate(password))
          return @account
      end
    end

    private
    attr_reader :name, :password
  end
end