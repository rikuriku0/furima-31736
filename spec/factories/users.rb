FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"陸"}
    first_name {"松村"}
    last_name_kana {"りく"}
    first_name_kana {"まつむら"}
    birthday {"1997-07-26"}
  end
end