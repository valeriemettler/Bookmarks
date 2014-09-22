module UserBookmarksHelper
  def get_user_bookmark_for(bookmark)
    Rails.logger.info ">>>>> bookmark: #{bookmark.inspect}"
    Rails.logger.info ">>>> user_bookmarks: #{current_user.user_bookmarks.where(bookmark_id: bookmark.id).first.inspect}"
    current_user.user_bookmarks.where(bookmark_id: bookmark.id).first
  end
end
