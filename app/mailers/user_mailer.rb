class UserMailer < ActionMailer::Base
  default from: "bookmarks@example.com"

  def notify(bookmark)
    @bookmark = bookmark
   
    mail(to: user.email, subject: 'Your Bookmark was Saved!')
  end
end
