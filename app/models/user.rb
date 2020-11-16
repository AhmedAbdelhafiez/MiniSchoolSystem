class User < ApplicationRecord
  validates :username ,presence: true
  validates :fullname ,presence: true
  validates :dateOfBirth ,presence: true
  has_one :teacher
  has_one :student

end
