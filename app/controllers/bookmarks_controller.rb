class BookmarksController < ApplicationController
    before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

    def index
      @bookmarks = Bookmark.all
    end

    def show
    end

    def new
      @bookmark = Bookmark.new
    end

    def edit
    end
    
    #def create
      #@bookmark = Bookmark.new(bookmark_params)

      #respond_to do |format|
        #if @bookmark.save
          # topic_names = params[:topic_names]
          # topic_names = topic_names.split(" ")
          # topic_names.each do |topic_name|
            # you'll have a topic name like #topic1
            # use regex or some other method to get rid of the hash symbol
            # create a topic object with the remaining word
            # associate new topic with this bookmark using topic_bookmarks (create a new topic bookmark object)
          # end

          # add bookmark to user by creating a user bookmark similar to topic bookmark (but with current_user)

    def create
      bookmark = Bookmark.where(url: params[:bookmark][:url]).first
      @bookmark = bookmark.present? ? bookmark : Bookmark.new(bookmark_params)
      
      if @bookmark.save
         @bookmark.users << current_user
         Rails.logger.info ">>>>>>>>>>>>> Bookmark: #{@bookmark.inspect}"

         topic_names = params[:topic_names].split(' ')
         topic_names.each do |topic_name|
         name = topic_name.sub(/#/, '')

         @bookmark.topics << Topic.find_or_create_by_name(name)
      end

         respond_to do |format|
         format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
         format.json { render action: 'show', status: :created, location: @bookmark }
      end

      else
         respond_to do |format|
         format.html { render action: 'new' }
         format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end   
  end

    def update
      respond_to do |format|
        if @bookmark.update(bookmark_params)
          format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @bookmark.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @bookmark.destroy
      respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  private

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end
