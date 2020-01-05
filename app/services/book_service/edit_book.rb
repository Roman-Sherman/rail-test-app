module BookService
  class EditBook < ApplicationService
    def initialize(chg_book:)
      @chg_book = chg_book
    end

    def call
      @book = Book.joins(:format, :category).where(id: chg_book.id)
      @format = Format.find(chg_book.format_id)
      @category = Category.find(chg_book.category_id)
      @book.update(:title => chg_book.title, :isbn => chg_book.isbn, :format => @format, :category => @category)
    end

    private
    attr_reader :chg_book
  end
end
