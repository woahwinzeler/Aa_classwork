class Todo < ApplicationRecord
  validates :done, inclusion: { in: [true, false] }
  validates :title, :body, presence: true 
end
