class UserBookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.likes.collect(&:bookmark)
  end

  def show
  end

  def new
  end

  def edit
  end
end
