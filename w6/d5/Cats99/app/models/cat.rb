class Cat < ApplicationRecord
  validates :birth_date, :name, presence: true
  validates :sex, inclusion: {in: ['M', 'F']}
  validates :color, inclusion: {in: ['Brown', 'Black', 'White', 'Purple']}

end
