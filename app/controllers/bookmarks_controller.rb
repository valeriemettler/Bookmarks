class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
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
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    if @bookmark.save
      topic_names = params[:topic_names]
      topic_names = topic_names.map{|n| n.split("#").last}
      topic_names.each do |topic|
        topic = Topic.find_or_create_by(name: topic)
        @bookmark.topics << topic
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

        


  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
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

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end
