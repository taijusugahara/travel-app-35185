FactoryBot.define do
  factory :order_info do
    passport_number {'1234ABCD'}
    first_name {"YAMADA"}
    last_name {"TAROU"}
    nationality{"JAPAN"}
    birthday{"2000/2/2"}
    gender{"男"}
    registered_place{"OSAKA"}
    issue_date {'2016/9/1'}
    expiry_date {'2022/9/3'}
    token{"tok_abcdefghijk"}
  end
end