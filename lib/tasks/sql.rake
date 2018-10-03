desc 'Все посты модераторов'
task :sql => :environment do
	puts Post.where(user_id: User.where(moderator: true).pluck(:id)).pluck(:title, :body)
end
