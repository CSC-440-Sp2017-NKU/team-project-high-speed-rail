# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create!(title:  "Sample Question!",
                 content: "How do I do rails? ")

20.times do |n|
  title  = Faker::StarWars.quote
  content = Faker::ChuckNorris.fact
  Question.create!(title:  title,
                   content: content)
end

questions = Question.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  questions.each do |question| 
      answer = question.answers.create!(content: content)
      for _ in 1..10 do
          random_boolean = [true, false].sample
          answer.ratings.create!(is_liked: random_boolean)
      end
  end
end

