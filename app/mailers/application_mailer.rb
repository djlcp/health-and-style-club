class ApplicationMailer < ActionMailer::Base
  default from: 'Health & Style Club'
  # pages 'mailer'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
