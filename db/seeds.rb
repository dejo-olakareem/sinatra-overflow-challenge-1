require 'faker'


# 10.times do
#   User.create!( :username => Faker::Ancient.god,
#                 :email      => Faker::Internet.email,
#                 :password   => 'password' )
# end

30.times do
  Question.create!( :title => Faker::TwinPeaks.quote,
                :body      => Faker::Hipster.sentence,
                :user_id => rand(1..10)
                 )
end

30.times do
  Answer.create!( :body      => Faker::Hacker.say_something_smart,
                  :user_id => rand(1..10),
                  :question_id => rand(1..30),
                 )
end

# comment_options = [Answer, Question]
# 30.times do
#   Comment.create!( :body      => Faker::ChuckNorris.fact,
#                   :user_id => rand(1..10),
#                   :commentable_id => rand(1..30),
#                   :commentable_type => comment_options.sample
#                  )
# end

# vote_options = [Answer, Question, Comment]
# numbers = [-1, 1]
# 30.times do
#   Vote.create!(   :user_id => rand(1..10),
#                   :voteable_id => rand(1..30),
#                   :voteable_type => vote_options.sample,
#                   :vote_status => numbers.sample
#                  )
# end
