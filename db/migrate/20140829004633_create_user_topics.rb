class CreateUserTopics < ActiveRecord::Migration
  def change
    create_table :user_topics do |t|
      t.integer :user_id, index: true
      t.integer :topic_id, index: true

      t.timestamps
    end
  end
end
