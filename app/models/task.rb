
class Task < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :description, length: { maximum: 200 }
    validates :completed, inclusion: { in: [true, false] }
  end
  