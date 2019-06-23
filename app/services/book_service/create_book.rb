module BookService
  class CreateBook < ApplicationService
    def initialize(title:, isbn:, format_id:, category_id:)
      @title = title
      @isbn = isbn
      @format_id = format_id
      @category_id = category_id
    end

    def call
      @format = Format.find(format_id)
      @category = Category.find(category_id)
      @book = Book.create!(:title => title, :isbn => isbn, :format => @format, :category => @category)
    end

    private
    attr_reader :title, :isbn, :format_id, :category_id
  end
end
