class Currency < ApplicationRecord
	default_scope { order(name: :asc) }

  before_save { self.code = code.to_s.squish.upcase }

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
	validates :code, presence: true, uniqueness: { case_sensitive: false }
	validates :symbol, presence: true, length: { is: 1 }, uniqueness: { case_sensitive: false }
  validates :active, inclusion: { in: [true, false] }

  scope :active, -> { where(active: true) }
end
