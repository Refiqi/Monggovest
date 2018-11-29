# frozen_string_literal: true

class User < ApplicationRecord
  # Necessary to authenticate.
  has_secure_password

  # Basic password validation, configure to your liking.
  validates_length_of       :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  before_validation do
    (self.email = email.to_s.downcase) && (self.name = name.to_s.downcase)
  end

  # Make sure email and username are present and unique.
  validates_presence_of     :email
  validates_presence_of     :name
  validates_uniqueness_of   :email
  # validates_uniqueness_of   :username

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end
