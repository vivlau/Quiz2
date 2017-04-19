FactoryGirl.define do
  factory :idea do
    sequence(:title) {|n| "#{Faker::Commerce.product_name} #{n}" }
    body { Faker::Hipster.paragraph }
    name {Faker::Name.first_name}
    likes { 10 + rand(100) }
    members { 10 + rand(10) }
  end
end
