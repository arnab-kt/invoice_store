class Country < ApplicationRecord
  before_save { self.code = code.upcase }

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :code, presence: true, length: { is: 2 }, uniqueness: { case_sensitive: false }
  validates :active, inclusion: { in: [true, false] }

  scope :active_countries, -> { where(active: true) }
end
