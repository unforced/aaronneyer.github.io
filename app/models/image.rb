class Image < ActiveRecord::Base
	belongs_to :post, :foreign_key => :model_id
	has_attached_file :photo, :styles => { :small => "150x150>", :large => "320x240>" }
	validates :photo, :attachment_presence => true

end
