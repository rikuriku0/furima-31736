FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = ("1a" + Faker::Internet.password(min_length: 6))
    password {password}
    password_confirmation {password}
    last_name {"陸"}
    first_name {"松村"}
    last_name_kana {"リク"}
    first_name_kana {"マツムラ"}
    birthday {"1997-07-26"}
  end
end