class Bookmark < ActiveRecord::Base
  
  has_many :bookmark_topics
  has_many :topics, through: :bookmark_topics

  has_many :user_bookmarks
  has_many :users, through: :user_bookmarks

  has_many :likes, dependent: :destroy


 default_scope { order('updated_at DESC') }

end
