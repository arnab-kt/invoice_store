class Country < ApplicationRecord
  default_scope { order(name: :asc) }

  before_save { self.code = code.to_s.squish.upcase }

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :code, presence: true, length: { is: 2 }, uniqueness: { case_sensitive: false }
  validates :active, inclusion: { in: [true, false] }

  scope :active, -> { where(active: true) }
end
