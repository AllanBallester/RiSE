
class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
   def confirm(riser)
    @riser = riser

    mail(to: @riser.email, subject: 'Confirmation instructions')
  end

  def welcome(riser)
    @riser = riser  # Instance variable => available in view

    mail(to: @riser.email, subject: 'Start to RiSE ✌️')
  end

  def add_rised(riser, homeless)
    @homeless = homeless
    @riser = riser

    mail(to: @riser.email, subject: 'One less Invisible 👏')
  end

  def review(riser, homeless)
    @homeless = homeless
    @riser = riser


    mail(to: @riser.email, subject: 'Make them shine ✨')
  end

end
