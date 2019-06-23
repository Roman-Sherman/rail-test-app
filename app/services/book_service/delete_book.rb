module BookService
  class DeleteBook < ApplicationService
    def initialize(id:)
      @id = id
    end

    def call
      @book = Book.find(id)
      @book.destroy
    end

    private
    attr_reader :id
  end
end