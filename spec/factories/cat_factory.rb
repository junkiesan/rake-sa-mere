FactoryBot.define do
  factory :cat do
    name { Faker::Creature::Cat.name }
    age { rand(0...15) }
    race { Faker::Creature::Cat.breed }
    user_id { User.sample.id }
  end
end