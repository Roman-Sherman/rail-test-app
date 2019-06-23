class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :format, :category
end
