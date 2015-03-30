class User < ActiveRecord::Base
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { maximum: 30 },
                       format: { with: /\A[a-zA-Z0-9_-]+\z/ }
  validates :email,    presence: true, uniqueness: { case_sensitive: false },
                       format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
  has_secure_password

  has_many :links, dependent: :destroy

  private

  def downcase_email
    self.email = email.downcase
  end
end
