class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :username, :email, presence: true, uniqueness: true

  scope :by_username_or_email, -> (term) { where('username = :term or email = :term', term: term) }

  def authenticated?(token)
    BCrypt::Password.new(password_digest).is_password?(token)
  end
end
