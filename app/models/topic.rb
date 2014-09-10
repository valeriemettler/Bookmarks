class Topic < ActiveRecord::Base  
  has_many :bookmark_topics
  has_many :bookmarks, through: :bookmark_topics

  validates :topic, uniqueness: true
end
