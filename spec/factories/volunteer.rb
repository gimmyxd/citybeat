FactoryGirl.define do
  factory :volunteer do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::Number.number(10) }
    age { Faker::Number.between(10, 70) }
    cnp { Faker::Number.number(5) }
    gender { Faker::Demographic.sex }
    project_id { FactoryGirl.create(:project).id }
  end
end
