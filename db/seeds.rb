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
