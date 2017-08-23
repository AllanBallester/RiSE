
class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
   def confirm(riser)
    @riser = riser

    mail(to: @riser.email, subject: 'The World of Kindness')
  end

  def welcome(riser)
    @riser = riser  # Instance variable => available in view

    mail(to: @riser.email, subject: 'Your Presence matter')
  end

  def add_rised(riser, homeless)
    @homeless = homeless
    @riser = riser

    mail(to: @riser.email, subject: 'Your Action matter')
  end

  def review(riser)
    @riser = riser

    mail(to: @riser.email, subject: 'Your Words matter')
  end

end
