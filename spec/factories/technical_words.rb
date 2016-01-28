FactoryGirl.define do
  factory :technical_word do
    name { %w(JavaScript Ruby PHP Python Java).sample }
    sequence(:description) {|n| "技術用語の具体的な説明を登録できるようにしてます。#{n}"}
  end
end
