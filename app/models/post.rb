class Post < ActiveRecord::Base
  attr_accessible :content, :title, :photo
	has_attached_file :photo

  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true

	def to_param
		"#{id} #{title}".parameterize
	end
end
