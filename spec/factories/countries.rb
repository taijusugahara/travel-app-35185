FactoryBot.define do
  factory :country do
    name { 'タイ' }
    association :user
  end
end
