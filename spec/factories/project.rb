FactoryGirl.define do
  factory :project do
    title {Faker::Name.name }
    description {Faker::Lorem.paragraphs }
    keywords {Faker::Lorem.words(4) }
    status {Faker::Lorem.word }
    photo {Faker::Lorem.word}
  end
end