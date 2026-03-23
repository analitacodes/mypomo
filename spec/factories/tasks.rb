FactoryBot.define do
  factory :task do
    name { "Title of Test Task" }
    description { "Working on the test task" }
    completed { false }
    pomodoro_count { 0 }
    association :user
  end
end
