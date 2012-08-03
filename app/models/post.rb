class Post < ActiveRecord::Base
  attr_accessible :content, :title, :photo, :post_type

  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true

	TYPES = ['Blog', 'Home', 'Projects']

	def to_param
		"#{id} #{title}".parameterize
	end
end
