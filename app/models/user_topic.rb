class UserTopic < ActiveRecord::Base

  # not using - safe to remove
  belongs_to :user
  belongs_to :topic
end
