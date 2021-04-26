FactoryBot.define do
  factory :plane_go do
    name {'飛行機A'}
    price {15000}
    howmany{3}
    go_date {'2021/9/1'}
    go_time{'03:00'}
    association :user
    association :country
  end
end
