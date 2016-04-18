class School < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search,
                  against: [:title],
                  using: { tsearch: { prefix: true }}

  validates :title, presence: true

  has_many :departments
  has_many :courses, through: :departments
end
