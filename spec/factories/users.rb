FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password = {Faker::Internet.password(min_length: 6, mix_case: true)}
    password              {password}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {Faker::Date.between(from: '1990-01-01', to: '2020-12-31')}
  end
end