FactoryBot.define do
  factory :user do
    nickname           {'furima太郎'}
    email              {'test@example'}
    password           {'password000000'}
    encrypted_password {password}
    last_name          {'山田'}
    first_name         {'陸太郎'}
    last_name_kana     {'ヤマダ'}
    first_name_kana    {'リクタロウ'}
    birthday           {'2000-01-01'}
  end
end