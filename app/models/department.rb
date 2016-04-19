class Department < ActiveRecord::Base
  include PgSearch

  # Scopes
  scope :by_school, ->(id) { where(school_id: id) }
  pg_search_scope :search, against: [:title],
                  using: { tsearch: { prefix: true }}

  # Validations
  validates :title, presence: true
  validates :abbreviation, presence: true

  # Associations
  belongs_to :school
  has_many :courses
end
