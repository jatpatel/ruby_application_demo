FactoryGirl.define do
  factory :product do

   name do
     Faker::Beer.unique.name
   end

    code do
      name.slice(0, Faker::Number.positive(1, 3)).upcase
    end

    price Faker::Number.number(2)

    # associated model instance
    category do
      Category.first || FactoryGirl.create(:category)
    end
  end
end

def random_number
  seed = Faker::Random.new_seed
  Faker::Random.rand(seed)
end
