module BookService
  class DeleteBook < ApplicationService
    def initialize(chg_book:)
      @chg_book = chg_book
    end

    def call
      @book = Book.find(chg_book.id)
      @book.destroy
    end

    private
    attr_reader :chg_book
  end
end