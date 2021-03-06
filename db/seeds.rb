# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.destroy_all
User.destroy_all
Permission.destroy_all
PermissionRole.destroy_all
Permission.new.setup_actions_controllers_db
permission = Permission.create action: :access, subject_class: :rails_admin
permission = Permission.create action: :dashboard, subject_class: :rails_admin


admin = Role.create name: "Admin", permissions: Permission.all
User.create name: "Admin", email: "admin@mail.com", password: "password", role: admin


HashtagReaction.destroy_all
Hashtag.destroy_all
Reaction.destroy_all
UserReaction.destroy_all

hashtag = Hashtag.create name: "#foraDilma"
reaction = Reaction.create name: "Like"
reaction.hashtags.push hashtag
reaction.save

hashtag = Hashtag.create name: "#foraTemer"

hashtag = Hashtag.create name: "#foraLula"
reaction = Reaction.create name: "Love"
reaction.hashtags.push hashtag
reaction.save

hashtag = Hashtag.create name: "#foraObama"
reaction = Reaction.create name: "Haha"
reaction.hashtags.push hashtag
reaction.save

hashtag = Hashtag.create name: "#foraNeymar"
reaction = Reaction.create name: "Wow"
reaction.hashtags.push hashtag
reaction.save

hashtag = Hashtag.create name: "#foraCunha"
reaction = Reaction.create name: "Sad"
reaction.hashtags.push hashtag
reaction.save

hashtag = Hashtag.create name: "#foraSarney"
reaction.hashtags.push hashtag
reaction.save

hashtag = Hashtag.create name: "#foraTodos"

reaction = Reaction.create name: "Angry"



users = User.all()
reactions = Reaction.all()
users.each do |user|
	user.reactions += reactions
  user.save
end
UserReaction.all.update_all(status: false)






