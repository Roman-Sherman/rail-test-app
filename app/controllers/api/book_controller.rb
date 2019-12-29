class Api::BookController < ApplicationController

    # GET /api/book/list&page=:page&size=:size
    def index
        @page = BookService::FindAllBook.call(page: params[:page].to_i + 1, size: params[:size])
        render json: @page.to_json(:include => [:format, :category])
    end

    # GET /api/book/search&query=:query&page=:page&size=:size
    def search
        @page = BookService::FindTitleBook.call(title: params[:query], page: params[:page].to_i + 1, size: params[:size])
        render json: @page.to_json(:include => [:format, :category])
    end

    # POST /api/book/new
    def create
        @book = BookService::CreateBook.call(reg_book: Dtos::BookDto::RegBook.new(params: params.to_unsafe_h))
        json_response(@book, :created)
    end

    # GET /api/book/:id
    def show
        @book = BookService::FindBook.call(id: params[:id])
        json_response(@book)
    end

    # POST /api/book/edit
    def update
        BookService::EditBook.call(chg_book: Dtos::BookDto::ChgBook.new(params: params.to_unsafe_h))
        head :no_content
    end

    # POST /api/book/delete
    def destroy
        BookService::DeleteBook.call(chg_book: Dtos::BookDto::ChgBook.new(params: params.to_unsafe_h))
        head :no_content
    end
end
