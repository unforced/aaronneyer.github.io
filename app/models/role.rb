class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :users

	def self.admin
		Role.find(1)
	end

	def self.editor
		Role.find(2)
	end

	def self.normal_user
		Role.find(3)
	end
end
