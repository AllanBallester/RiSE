# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
def confirm
    user = Riser.first
    UserMailer.confirm(user)
  end

def welcome
    user = Riser.first
    UserMailer.welcome(user)
  end

  def add_rised
    user = Riser.first
    UserMailer.confirm(user)
  end

  def review
    user = Riser.first
    UserMailer.review(user)
  end

end
