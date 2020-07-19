# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  user = AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', name: 'Default user')
  category = Category.create!(name: 'Docker')
  Post.create!(admin_user: user, category: category, title: 'Welcome to Docker Study Group!', body: 'This is the first day of our Docker Study Group!')
end
