# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'admin@s314.ru', password: 'qwerty', password_confirmation: 'qwerty')
user.update_attribute :admin, true
category = Category.create(title: 'Production', game: false)
Article.create(
  title: 'Начало положено',
  description: 'Здесь начинается история Conflagration Games!' \
              'Наш сайт будет потихоньку наполняться всевозможными новостями ' \
              'о разработке и всякой всячине :) Ждите обновлений!',
  contents: "<h2>Начало положено!</h2>
            Теперь мы можем свободно доносить до вас новости с фронта разработки, дорогие пользователи!",
  category: category,
  author: user
)