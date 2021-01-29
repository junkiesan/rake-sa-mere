class Cat < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :race, presence: true
end
