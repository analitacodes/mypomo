class FocusSession < ApplicationRecord
 belongs_to :user
 belongs_to :task
 
 validates :duration_minutes, presence: true,
            numericality: { greater_than: 0 }
end
