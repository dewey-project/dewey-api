class Department < ActiveRecord::Base
  validates :title, presence: true
  validates :abbreviation, presence: true

  belongs_to :school
  has_many :courses
end
