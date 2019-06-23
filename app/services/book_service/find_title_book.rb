module BookService
  class FindTitleBook < ApplicationService
    def initialize(title:, page:, size:)
      @title = title
      @page = page
      @size = size
    end

    def call
      books = Book.all.joins(:format, :category).where("title like '%" + title + "%'").page(page).per(size)
      pageobj = Page.new(books, books.total_pages)
    end

    private
    attr_reader :title, :page, :size
  end
end
