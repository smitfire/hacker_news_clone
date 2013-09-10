require 'faker'

5.times do |n|
  User.create(:name => Faker::Lorem.word,:email => Faker::Lorem.word+"#{n+1}@hackernews.org", :password => "#{n}")
end

20.times do |n|
  Post.create(:title => Faker::Lorem.words(2..5).join(' '), :content => Faker::Lorem.words(10..20).join(' '), :user_id => rand(1..5))
end

100.times do |n|
  Comment.create(:title => Faker::Lorem.word,:content => Faker::Lorem.words(10..30).join(' '), :post_id => rand(1..20), :user_id => rand(1..5))
end
