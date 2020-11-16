class Course < ApplicationRecord
  validates :name ,presence: true
  has_many :assignments, dependent: :destroy
  has_one :teacher, dependent: :destroy
end
