FactoryBot.define do
  factory :comment do
    body { "MyString" }
    author_id { 1 }
    user_commented_id { 1 }
  end
end
