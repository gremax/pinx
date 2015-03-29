class User < ActiveRecord::Base
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { maximum: 30 }
  validates :email,    presence: true, uniqueness: { case_sensitive: false },
                       format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
