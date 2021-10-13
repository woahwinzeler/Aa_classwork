class Band < ApplicationRecord
  validates :name, :location, presence:true 
end
