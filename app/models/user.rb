class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  before_save { self.email = email.downcase }

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }


  def self.find_from_auth_hash(auth)
    where(email: auth.info.email).first
  end

  def update_user(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
  end
end
