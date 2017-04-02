FactoryGirl.define do
  factory :category do
    code Faker::Code.unique
    name Faker::Name.unique
  end
end

