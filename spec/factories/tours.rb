FactoryBot.define do
  factory :tour do
    name {'ツアーA'}
    price {100000}
    howmany{3}
    span {5}
    go_date {'2021/9/1'}
    association :user
    association :country

  end
end
