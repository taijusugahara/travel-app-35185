FactoryBot.define do
  factory :hotel do
    name {'ホテルあいうえお'}
    price {3000}
    day {2}
    go_date {'2021/9/1'}
    back_date {'2021/9/3'}
    association :user
    association :country
  end
end
