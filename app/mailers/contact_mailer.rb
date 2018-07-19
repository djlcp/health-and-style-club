class ContactMailer < ActionMailer::Base
  default from: 'info@healthandstyleclub.com'
  # pages 'mailer'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
