class Comment < ActiveRecord::Base
  attr_accessible :body, :photo_id, :user_id
  belongs_to :user
  belongs_to :photo 
end
