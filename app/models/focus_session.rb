class FocusSession < ApplicationRecord
 belongs_to :user
 belongs_to :task, optional: true
 
 validates :duration_minutes, presence: true,
            numericality: { greater_than: 0 }
end
