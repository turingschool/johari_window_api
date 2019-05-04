FactoryBot.define do
  factory :user do
    name { Faker::TvShows::GameOfThrones.character }
    token { SecureRandom.hex }
    github { "github" + rand(1000000).to_s }
  end
end
