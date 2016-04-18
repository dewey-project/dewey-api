class School < ActiveRecord::Base
  validates :title, presence: true

  has_many :departments
  has_many :courses, through: :departments
end
