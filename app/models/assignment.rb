class Assignment < ApplicationRecord
  validates :name ,presence: true
  belongs_to :course, optional: true
  has_one :student
end
