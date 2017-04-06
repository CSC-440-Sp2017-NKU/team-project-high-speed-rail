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

se = Course.create(code: "CSC 440", title: "Software Engineering", days: "TR", start_time: "16:45:00", end_time: "18:05:00")
os = Course.create(code: "CSC 460", title: "Operating Systems", days: "TR", start_time: "15:05:00", end_time: "16:20:00")
ai = Course.create(code: "CSC 425", title: "Artificial Intelligence", days: "MW", start_time: "16:45:00", end_time: "18:05:00")
tc = Course.create(code: "CSC 485", title: "Theory of Computation", days: "TR", start_time: "13:45:00", end_time: "15:05:00")
wp = Course.create(code: "CSC 301", title: "Web Programming", days: "MW", start_time: "16:45:00", end_time: "18:05:00")

User.create_student(name: "E.J.", email: "student1@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << os << ai
User.create_student(name: "Andy", email: "student2@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << os << tc << wp
User.create_student(name: "Matt", email: "student3@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << ai << tc
User.create_student(name: "Mike", email: "student4@nku.edu", password: "password", password_confirmation: "password").enrolled_courses << se << ai

User.create_faculty(name: "Tim McCord", email: "faculty1@nku.edu", password: "password", password_confirmation: "password").taught_courses << se
User.create_faculty(name: "Gary Newell", email: "faculty2@nku.edu", password: "password", password_confirmation: "password").taught_courses << os << tc
User.create_faculty(name: "Richard Fox", email: "faculty3@nku.edu", password: "password", password_confirmation: "password").taught_courses << ai
User.create_faculty(name: "Jesse Hockenburry", email: "faculty4@nku.edu", password: "password", password_confirmation: "password").taught_courses << wp

# Question.create!(title:  "Cats go for world domination",
#                 content: "Make muffins where is my slave? I'm getting hungry cat is love, cat is life. Refuse to drink water except out of someone's glass touch water with paw then recoil in horror sit by the fire purr. Give attitude scamper but hide head under blanket so no one can see yet love to play with owner's hair tie, hunt by meowing loudly at 5am next to human slave food dispenser. Stares at human while pushing stuff off a table. Hate dog stares at human while pushing stuff off a table. Spill litter box, scratch at owner, destroy all furniture, especially couch lies down . Refuse to drink water except out of someone's glass sit in box, or meow meow, i tell my human and intrigued by the shower, and immediately regret falling into bathtub but hiss at vacuum cleaner cat not kitten around . Meow all night having their mate disturbing sleeping humans intently sniff hand, yet chase mice this human feeds me, i should be a god. If it smells like fish eat as much as you wish if it fits, i sits inspect anything brought into the house touch water with paw then recoil in horror so meowing non stop for food refuse to drink water except out of someone's glass. Present belly, scratch hand when stroked present belly, scratch hand when stroked yet sun bathe lies down annoy owner until he gives you food say meow repeatedly until belly rubs, feels good fall over dead (not really but gets sypathy) milk the cow. Lick the other cats has closed eyes but still sees you so scratch at the door then walk away yet chase the pig around the house. Instantly break out into full speed gallop across the house for no reason playing with balls of wool. Vommit food and eat it again give attitude. Fall asleep on the washing machine hiss at vacuum cleaner. Cats go for world domination burrow under covers, and lick the curtain just to be annoying or annoy owner until he gives you food say meow repeatedly until belly rubs, feels good. Sit and stare cat is love, cat is life but vommit food and eat it again who's the baby sleep on dog bed, force dog to sleep on floor where is my slave? I'm getting hungry. Howl uncontrollably for no reason. Pooping rainbow while flying in a toasted bread costume in space sleep on keyboard meow for food, then when human fills food dish, take a few bites of food and continue meowing sleep on dog bed, force dog to sleep on floor scratch at the door then walk away flop over. Chase after silly colored fish toys around the house. ")

# 20.times do |n|
#   title  = Faker::StarWars.quote
#   content = Faker::ChuckNorris.fact
#   Question.create!(title:  title,
#                   content: content)
# end

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

