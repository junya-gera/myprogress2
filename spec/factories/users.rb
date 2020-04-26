FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    sequence(:email) {Faker::Internet.email}
    password              {"00000000"}
    image                 {"aaa"}

  end

end