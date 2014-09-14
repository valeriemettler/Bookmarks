class FollowUpMailer < ActionMailer::Base
  default from: "valeriemettler@gmail.com"

  def notify(user, bookmark)
    @user = user
    @bookmark = bookmark
   
    mail(to: user.email, subject: 'Your bookmark was saved!')
  end
end