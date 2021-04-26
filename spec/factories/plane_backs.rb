FactoryBot.define do
  factory :plane_back do
    name {'飛行機A'}
    price {18000}
    howmany{3}
    back_date {'2021/9/1'}
    back_time{'03:00'}
    association :user
    association :country
  end
end
