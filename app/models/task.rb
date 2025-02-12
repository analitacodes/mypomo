class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, allow_blank: true
  validates :completed, inclusion: { in: [ true, false ] }
  validates :pomodoro_count, only_integer: true
end
