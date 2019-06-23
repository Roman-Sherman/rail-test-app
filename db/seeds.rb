# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account = Account.new(name: "test", password: "password", password_confirmation: "password")
account.save

categories = Category.create([
    { name: '技術書' },
    { name: '小説' },
    { name: '雑誌' }
])

formats = Format.create([
    { name: '書籍' },
    { name: '電子書籍' }
])

15.times do |n|
    Book.create(
        title: "テスト_#{n}",
        isbn: "123-123-123-#{n}",
        format: formats[(n+1)%2],
        category: categories[(n+1)%3]
    )
end