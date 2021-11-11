class Todo < ApplicationRecord
  validates :done, inclusion: { in: [true, false] }
  validates :title, presence: true 
end
