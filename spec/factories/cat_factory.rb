FactoryBot.define do
  factory :cat do
    name { Faker::Creature::Cat.name }
    age { rand(0...15) }
    race { Faker::Creature::Cat.breed }
  end
end