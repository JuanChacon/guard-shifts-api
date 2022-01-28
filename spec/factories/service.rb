FactoryBot.define do
  factory :service do
    name {Faker::TvShows::StarTrek.character}
  end
end