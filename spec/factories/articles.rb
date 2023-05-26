FactoryBot.define do
  factory :article do
    title { "title" }
    description { "description" }
  end

  factory :user do
    username { "username" }
    email { "momo@momo.com" }
    password { "password" }
  end
end

