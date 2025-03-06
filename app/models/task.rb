class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { maximum: 500 }, allow_blank: true # allow_blank is an option so it cannot be a stand alone validation - will get error, has to be tied to length

  validates :completed, inclusion: { in: [ true, false ] }
  validates :pomodoro_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # this is to make sure the information is true when obtaining it from the user
end


class Task
  has_rich_text :description
  validates :name, presence: true
end
