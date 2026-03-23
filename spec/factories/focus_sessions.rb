FactoryBot.define do
  factory :focus_session do
    association :user   # creates a real user automatically
    association :task
    duration_minutes { 25 }
    completed_at { Time.current }
  end
end
