class Cat < ApplicationRecord
  belongs_to :user
  validates :name, :age, :race, presence: true
  # validates :age, presence: true
  # validates :race, presence: true

  def self.greeting
    "Meow!"
  end
end
