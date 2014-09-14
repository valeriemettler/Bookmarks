class LikesController < ApplicationController
  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
 
     if like.save
       # Add code to generate a success flash and redirect to @bookmark
       flash[:notice] = "Liked bookmark"
       # Remember the path shortcut: [@bookmark.topic, @bookmark]
       redirect_to [@bookmark.topic, @bookmark]
     else
       # Add code to generate a failure flash and redirect to @post
       flash[:error] = "Unable to add like. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
     end
  end
  def destroy
      @bookmark = Bookmark.find(params[:bookmark_id])
      like = current_user.likes.find(params[:id])

      authorize like

      if like.destroy
        flash[:notice] = "Removed like."
        redirect_to [@bookmark.topic, @bookmark]
      else
        flash[:error] = "Unable to remove like. Please try again."
        redirect_to [@bookmark.topic, @bookmark]
      end
    end
  end
