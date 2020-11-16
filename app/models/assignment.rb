class Assignment < ApplicationRecord
  validates :name ,presence: true
  belongs_to :course
  has_one :student
end
