class Department < ActiveRecord::Base
  validates :title, presence: true
  validates :abbreviation, presence: true

  has_many :courses
end
