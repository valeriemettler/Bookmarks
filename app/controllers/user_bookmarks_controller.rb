class UserBookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookmarks = current_user.bookmarks
    @topics = @bookmarks.collect(&:topics).flatten.uniq
    @liked_bookmarks = current_user.likes.collect(&:bookmark)
    @liked_topics = @liked_bookmarks.collect(&:topics).flatten.uniq 
  end

  def destroy
    @user_bookmark = current_user.user_bookmarks.find(params[:id])
    if @user_bookmark.destroy
      flash[:notice] = "Removed bookmark."
      redirect_to user_bookmarks_path
    else
      flash[:error] = "Unable to remove bookmark.  Please try again."
      redirect_to user_bookmarks_path
    end
  end
end