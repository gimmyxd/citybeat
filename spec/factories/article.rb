FactoryGirl.define do
  factory :articles do
    title { Faker::Name.name }
    url { Faker::Name.name }
    project_id FactoryGirl.create(:project).id
  end
end
