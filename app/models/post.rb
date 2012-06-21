class Post < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
end
