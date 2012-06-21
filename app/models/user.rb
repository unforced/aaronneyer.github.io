class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :secret_key
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :role, presence: true

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
end
