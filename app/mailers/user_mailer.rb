# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def forgot(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Password')
  end
end
