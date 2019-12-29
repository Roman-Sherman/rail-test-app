class Dtos::BookDto
  class RegBook
    def initialize(params:)
      @title = params[:title]
      @isbn = params[:isbn]
      @format_id = params[:formatId]
      @category_id = params[:categoryId]
    end

    public
    attr_reader :title, :isbn, :format_id, :category_id
  end
  
  class ChgBook
    def initialize(params:)
      @id = params[:id]
      @title = params[:title]
      @isbn = params[:isbn]
      @format_id = params[:formatId]
      @category_id = params[:categoryId]
    end

    public
    attr_reader :id, :title, :isbn, :format_id, :category_id
  end
end