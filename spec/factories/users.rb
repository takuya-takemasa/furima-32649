FactoryBot.define do
  factory :user do
    nickname {'aa'}
    email {'aa@aa'}                
    password {'aaa111'}            
    password_confirmation {password}
    last_name             {'てすと'}
    fast_name            {'てすと'}
    last_name_kana        {'テスト'}
    fast_name_kana       {'テスト'}
    birth_day             {'1930-1-1'}
  end
end