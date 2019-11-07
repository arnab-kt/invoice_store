class Country < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :code, presence: true, length: { maximum: 2 }
  validates :active, inclusion: { in: [true, false] }

  scope :active_countries, -> { where(active: true) }
end
