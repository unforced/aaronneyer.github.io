class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :role_id
	cattr_accessor :current_user
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :name, presence: true
  validates :role_id, presence: true
	validate :can_edit_role

  has_many :posts, dependent: :destroy
  belongs_to :role

	def is_admin?
		return self.role == Role.admin
	end

	def is_editor?
		return self.role == Role.admin || self.role == Role.editor
	end

  private

  	def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end

		def can_edit_role
			if self.role_id && self.changed.include?('role_id') && self.role_id != 3 && (!User.current_user || !User.current_user.is_admin?)
				errors.add(:role, ' can not be edited by non-admins')
			end
		end
end
