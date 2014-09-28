class Bookmark < ActiveRecord::Base
  #attr_accessible :thumbnail_url

  has_many :bookmark_topics
  has_many :topics, through: :bookmark_topics

  has_many :user_bookmarks
  has_many :users, through: :user_bookmarks

  has_many :likes, dependent: :destroy


 default_scope { order('updated_at DESC') }

 after_create :set_embedly_url

 private 

 def set_embedly_url
  embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY'],
        :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

  Rails.logger.info ">>>> embedluy object: #{embedly_api.inspect}"
  
  obj = embedly_api.extract :url => self.url
  Rails.logger.info ">>>> embedly obj: #{obj.inspect}"
  # get result and find the attribute for the thumbnail_url
  # set the bookmark's thumbnail_url with that value -- update_attribute(thumbnail_url: val_of_thumbnail_url_from_response)
  o = obj.first
  Rails.logger.info ">>>> o: #{o.inspect}"
  image = o.images.first
  Rails.logger.info ">>>>> image: #{image.inspect}"

  update_attribute(:thumbnail_url, image['url'])
  Rails.logger.info ">>>> Now i am: #{self.inspect}"
  true
 end

end
