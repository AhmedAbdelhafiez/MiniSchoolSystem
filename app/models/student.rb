class Student < ApplicationRecord
  validates :classNo ,presence: true
  has_one :user ,dependent: :destroy
end
