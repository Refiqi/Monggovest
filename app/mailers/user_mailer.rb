# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Monggovest App')
  end
  
  def reset_password(user)
  	@user = user
  	mail(to: @user.email, subject: "Click this link to generate reset 
  						          password #{user.generate_password_token!}")
  end

end
