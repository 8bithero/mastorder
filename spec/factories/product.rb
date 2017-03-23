FactoryGirl.define do
  factory :product do
    uuid SecureRandom.uuid
    name Faker::Zelda.unique.game
    description Faker::RickAndMorty.unique.quote
    price  Money.new(1000)
  end
end
