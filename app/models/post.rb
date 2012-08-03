class Post < ActiveRecord::Base

  belongs_to :user
	has_many :images, :dependent => :destroy, :conditions => {:model_type => "Post"}, :foreign_key => :model_id

	accepts_nested_attributes_for :images, :reject_if => lambda{|i| i['photo'].nil?}, :allow_destroy => true
  
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true

	TYPES = ['Blog', 'Home', 'Projects']

	def to_param
		"#{id} #{title}".parameterize
	end
end
