class School < ActiveRecord::Base
  validates :title, presence: true

  has_many :courses
end
