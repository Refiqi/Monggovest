# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Monggovest App')
  end
  
  def reset_password(user)
  	@user = user
  	mail(to: @user.email, subject: "Token Password reset")
  end

end
