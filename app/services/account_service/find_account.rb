module AccountService
  class FindAccount < ApplicationService
    def initialize(id:)
      @id = id
    end

    def call
      @account = Account.find_by(id: id)
    end

    private
    attr_reader :id
  end
end