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
        @book = BookService::CreateBook.call(title: params[:title], isbn: params[:isbn], format_id: params[:format][:id], category_id: params[:category][:id])
        json_response(@book, :created)
    end

    # GET /api/book/:id
    def show
        @book = BookService::FindBook.call(id: params[:id])
        json_response(@book)
    end

    # POST /api/book/edit
    def update
        BookService::EditBook.call(id: params[:id], title: params[:title], isbn: params[:isbn], format_id: params[:format][:id], category_id: params[:category][:id])
        head :no_content
    end

    # POST /api/book/delete
    def destroy
        BookService::DeleteBook.call(id: params[:id])
        head :no_content
    end

    private

    def book_params
        # whitelist params
        params.permit(:title, :isbn, format: [:id, :name], category: [:id, :name])
    end
end
