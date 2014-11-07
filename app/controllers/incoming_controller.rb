class IncomingController < ApplicationController
        skip_before_filter :verify_authenticity_token

        def create
          Rails.logger.info "INCOMING PARAMS HERE: #{params}"
          Rails.logger.info "Topics: #{params[:subject]}"
          Rails.logger.info "Url: #{params['stripped-text']}"
          Rails.logger.info "User email: #{params[:sender]}"
          user = User.find_by_email(params[:sender])
          Rails.logger.info "@@@@@@@@@@@@@@@@ User: #{user.inspect}"

        if user
          @bookmark = Bookmark.find_or_create_by_url(params['stripped-text'])
          topics = []
          topic_names = params[:subject].split(' ')
          topic_names.each do |topic_name|
          name = topic_name.sub(/#/, '')
          topics << Topic.find_or_create_by_name(name)
        end

        if @bookmark.save
          topics.each do |topic| 
          @bookmark.topics << topic
         end
          user.bookmarks << @bookmark
          FollowUpMailer.notify(user, @bookmark).deliver
        end
      end    
    head 200 
  end
end