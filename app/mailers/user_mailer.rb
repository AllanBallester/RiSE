class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(riser)
    @riser = riser  # Instance variable => available in view

    mail(to: @riser.email, subject: 'Rise : The new world of kindness')
  end
end
