class Department < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search,
                  against: [:title],
                  using: { tsearch: { prefix: true }}

  scope :by_school, ->(school_id) { where(school_id: school_id) }

  validates :title, presence: true
  validates :abbreviation, presence: true

  belongs_to :school
  has_many :courses
end
