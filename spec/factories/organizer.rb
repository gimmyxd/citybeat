FactoryGirl.define do
  factory :organizer do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs(3) }
    funds { Faker::Number.number(5) }
  end
end
