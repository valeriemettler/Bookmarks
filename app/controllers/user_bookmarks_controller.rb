class UserBookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
    @topics = @bookmarks.collect(&:topics).flatten.uniq
    #@topics = @bookmarks.collect(&:topics).uniq # loop through this 
    @liked_bookmarks = current_user.likes.collect(&:bookmark)
    @liked_topics = @liked_bookmarks.collect(&:topic).uniq # loop through this
  end
end