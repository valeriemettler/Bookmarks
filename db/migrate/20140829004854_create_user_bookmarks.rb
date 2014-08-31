class CreateUserBookmarks < ActiveRecord::Migration
  def change
    create_table :user_bookmarks do |t|
      t.integer :user_id, index: true
      t.integer :bookmark_id, index: true

      t.timestamps
    end
  end
end
