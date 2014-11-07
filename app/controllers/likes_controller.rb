class LikesController < ApplicationController
  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)

     if like.save
       flash[:notice] = "Liked bookmark"
       redirect_to :back
     else
       flash[:error] = "Unable to add like. Please try again."
      redirect_to :back
     end
  end

  def destroy
      @bookmark = Bookmark.find(params[:bookmark_id])
      like = current_user.likes.find(params[:id])

      if like.destroy
        flash[:notice] = "Removed like."
        redirect_to :back
      else
        flash[:error] = "Unable to remove like. Please try again."
        redirect_to :back
     end
  end
end
