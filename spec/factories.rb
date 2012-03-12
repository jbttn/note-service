FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:username)   { |n| "foobar#{n}" }
    sequence(:email)      { |n| "email#{n}@mail.com" }
    password              "password"
    password_confirmation "password"
  end
  factory :note do
    sequence(:title)       { |n| "foobar#{n}" }
    owner
  end
end