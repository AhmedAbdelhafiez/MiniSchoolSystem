class Teacher < ApplicationRecord
  validates :levelNo ,presence: true
  has_one :user ,dependent: :destroy
  has_many :courses, dependent: :destroy
end
