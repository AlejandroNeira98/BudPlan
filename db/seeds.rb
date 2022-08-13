# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user = User.create(name: 'some name', email: 'some@email.com', password: 'some password')

@subject = Group.new(name: 'some category', user_id: @user.id)
@subject.icon.attach(io: File.open("#{Rails.root}/app/assets/images/image.jpg"), filename: 'image.jpg')
@subject.save

@deal = Deal.new(name: 'some deal', amount: 100, user_id: @user.id)
@deal.groups << @subject
@deal.save
