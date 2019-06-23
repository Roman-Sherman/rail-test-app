module BookService
  class FindBook < ApplicationService
    def initialize(id:)
      @id = id
    end

    def call
      @book = Book.joins(:format, :category).where(id: id)
    end

    private
    attr_reader :id
  end
end