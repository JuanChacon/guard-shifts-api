FactoryBot.define do
  factory :employee do
    name {Faker::TvShows::Simpsons.character}
  end
end