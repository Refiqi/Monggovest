# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Monggovest@gmail.com'
  layout 'mailer'
end
