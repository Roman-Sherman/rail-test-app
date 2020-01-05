module BookService
  class CreateBook < ApplicationService
    def initialize(reg_book:)
      @reg_book = reg_book
    end

    def call
      @format = Format.find(reg_book.format_id)
      @category = Category.find(reg_book.category_id)
      @book = Book.create!(:title => reg_book.title, :isbn => reg_book.isbn, :format => @format, :category => @category)
    end

    private
    attr_reader :reg_book
  end
end
