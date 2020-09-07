FactoryBot.define do
  factory :user do
    firstname {'山田'}
    lastname {'太郎'}
    firstname_kana {'ヤマダ'}
    lastname_kana {'タロウ'}
    email {'aaa@t'}
    nickname {'aaa'}
    birthday {'1997-05-03'}
    password {'taro1997522'}
    password_confirmation {password}
  end
end