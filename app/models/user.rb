# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_investors
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Necessary to authenticate.

  # Basic password validation, configure to your liking.
  validates_length_of :password, maximum: 72,
                                 minimum: 8, allow_nil: true,
                                 allow_blank: false
  validates_confirmation_of :password, allow_nil: true,
                                       allow_blank: false
  validates_length_of :name, minimum: 4,
                             maximum: 32, allow_nil: true,
                             allow_blank: false

  # It Will Downcase all the email and name to be saved in database.
  before_validation do
    (self.email = email.to_s.downcase) && (self.name = name.to_s.downcase)
  end

  # Make sure email and username are present and unique.
  validates_presence_of     :email
  validates_uniqueness_of   :email

  # Calling alias method for devise to be the same as Knock Variable
  alias authenticate valid_password?

  # Method for Generating Password Token in Database

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  # Method for checking if the token is valid or not.

  def password_token_valid?
    (reset_password_sent_at + 4.hours) > Time.now.utc
  end

  # Method for Reseting Password in database.Then Ii will return the reset password token to nil

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  # Method for Checking if the user role is admin

  def admin?
    role == 'admin'
  end

  # Method for Checking if the user role is user

  def user?
    role == 'user'
  end

  private

  # Calling in built ruby Securerandom method for Generating Token

  def generate_token
    SecureRandom.hex(10)
  end
end
