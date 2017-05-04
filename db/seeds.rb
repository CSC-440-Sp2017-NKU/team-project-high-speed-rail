# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Permission.create(name: "post")
Permission.create(name: "post_manage")
Permission.create(name: "topic")
Permission.create(name: "topic_manage")
Permission.create(name: "course_manage")
Permission.create(name: "user_manage")
Permission.create(name: "student")
Permission.create(name: "faculty")
Permission.create(name: "admin")

Course.create(code: "INF 120", title: "Elementary Programming", days: "MWF", start_time: "16:45:00", end_time: "18:05:00")
Course.create(code: "INF 282", title: "Introduction to Databases", days: "TR", start_time: "16:45:00", end_time: "18:05:00")
Course.create(code: "INF 284", title: "Introduction to Web Development", days: "MWF", start_time: "16:45:00", end_time: "18:05:00")
Course.create(code: "CSC 433", title: "Computer Networking", days: "TR", start_time: "16:45:00", end_time: "18:05:00")
se = Course.create(code: "CSC 440", title: "Software Engineering", days: "TR", start_time: "16:45:00", end_time: "18:05:00")
os = Course.create(code: "CSC 460", title: "Operating Systems", days: "TR", start_time: "15:05:00", end_time: "16:20:00")
ai = Course.create(code: "CSC 425", title: "Artificial Intelligence", days: "MW", start_time: "16:45:00", end_time: "18:05:00")
tc = Course.create(code: "CSC 485", title: "Theory of Computation", days: "TR", start_time: "13:45:00", end_time: "15:05:00")
wp = Course.create(code: "CSC 301", title: "Web Programming", days: "MW", start_time: "16:45:00", end_time: "18:05:00")

User.create_admin(name: "Admin", email: "admin@nku.edu", password: "password", password_confirmation: "password")

User.create_registrar(name: "Registrar", email: "registrar@nku.edu", password: "password", password_confirmation: "password")

User.create_faculty(name: "Tim McCord", email: "faculty1@nku.edu", password: "password", password_confirmation: "password").taught_courses << se
User.create_faculty(name: "Gary Newell", email: "faculty2@nku.edu", password: "password", password_confirmation: "password").taught_courses << os << tc
User.create_faculty(name: "Richard Fox", email: "faculty3@nku.edu", password: "password", password_confirmation: "password").taught_courses << ai
User.create_faculty(name: "Jesse Hockenburry", email: "faculty4@nku.edu", password: "password", password_confirmation: "password").taught_courses << wp

User.create_student(name: "E.J. Schroeder", email: "student1@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << os << ai
User.create_student(name: "Andy Gergel", email: "student2@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << os << tc << wp
User.create_student(name: "Matt Moellman", email: "student3@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << ai << tc
User.create_student(name: "Mikael Soto", email: "student4@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << ai


20.times do
  title  = Faker::StarWars.quote
  content = Faker::ChuckNorris.fact
  user = User.all.sample
  while !user.permission?(:post)
    user = User.all.sample
  end
  q = Question.create!(title:  title,
                  content: content,
                  user: user,
                  topic: Topic.all.sample)
  
  rand(10).times do
    user = User.all.sample
    while !user.permission?(:post)
      user = User.all.sample
    end
    q.answers.create!(content: Faker::Hipster.paragraph,
                      user: user)
  end
  
end

# questions = Question.order(:created_at).take(6)
# 5.times do
#   content = Faker::Hacker.say_something_smart
#   questions.each do |question| 
#       answer = question.answers.create!(content: content)
#       for _ in 1..10 do
#           random_boolean = [true, false].sample
#           answer.ratings.create!(is_liked: random_boolean)
#       end
#   end
# end

