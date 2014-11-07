class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :likes, dependent: :destroy
  has_many :user_bookmarks
  has_many :bookmarks, through: :user_bookmarks

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

end
