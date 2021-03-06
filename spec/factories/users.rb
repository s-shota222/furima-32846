FactoryBot.define do
  factory :user do
    nickname                  {"test"}
    email                     {"test@example"}
    password                  {"test111"}
    password_confirmation     { password }
    first_name                {"テスト"}
    last_name                 {"一郎"}
    first_name_ruby           {"テスト"}
    last_name_ruby            {"イチロウ"}
    birthday                  {"1930-01-01"}
  end
end