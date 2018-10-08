# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all #так как в таблице comments есть ссылки на таблицы posts и users, она чистится первой
Post.destroy_all #так как в таблице posts есть ссылки на таблицу users, она чистится второй
User.destroy_all #в последнюю очередь удаляются данные из таблицы users

hash_users = 10.times.map do
{
name: FFaker::Internet.user_name[0...16],
email: FFaker::Internet.safe_email,
password: '111111'
}
end

users = User.create! hash_users
users.first( 7 ).each { |u| u.update creator: true }
users.first( 2 ).each { |u| u.update moderator: true }


creators = User.where(creator: true)
hash_posts = 20.times.map do
{
title: FFaker::HipsterIpsum.sentence(3),
body: FFaker::HipsterIpsum.sentence(8),
user: creators.sample
}
end

posts = Post.create! hash_posts


hash_comments = 200.times.map do
commentable = ((rand( 2 ) == 1 ) ? posts : users).sample
{
body: FFaker::HipsterIpsum.sentence(5),
user: users.sample,
commentable_id: commentable.id,
commentable_type: commentable.class.to_s #в качестве типа логично взять наименование класса
}
end

Comment.create! hash_comments
