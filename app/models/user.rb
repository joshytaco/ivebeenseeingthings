class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  # AWS IAM credentials
  attr_encrypted :aws_access_key_id, key: Rails.application.credentials.secret_key_base
  attr_encrypted :aws_secret_access_key, key: Rails.application.credentials.secret_key_base
end
