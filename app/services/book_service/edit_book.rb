module BookService
  class EditBook < ApplicationService
    def initialize(id:, title:, isbn:, format_id:, category_id:)
      @id = id
      @title = title
      @isbn = isbn
      @format_id = format_id
      @category_id = category_id
    end

    def call
      @book = Book.joins(:format, :category).where(id: id)
      @format = Format.find(format_id)
      @category = Category.find(category_id)
      @book.update(:title => title, :isbn => isbn, :format => @format, :category => @category)
    end

    private
    attr_reader :id, :title, :isbn, :format_id, :category_id
  end
end
