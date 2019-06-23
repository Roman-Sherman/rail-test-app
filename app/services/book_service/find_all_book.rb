module BookService
  class FindAllBook < ApplicationService
    def initialize(page:, size:)
      @page = page
      @size = size
    end

    def call
      books = Book.all.joins(:format, :category).page(page).per(size)
      pageobj = Page.new(books, books.total_pages)
    end

    private
    attr_reader :page, :size
  end
end
