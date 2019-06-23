class Page
  attr_accessor :content, :totalPages

  def initialize(content, totalPages)
    @content, @totalPages = content, totalPages
  end
end