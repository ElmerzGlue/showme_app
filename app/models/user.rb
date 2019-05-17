class TeamValidator < ActiveModel::Validator
	def validate(user)
		if user.teams.length < 1
			user.errors[:teams] << "must be at least 1" unless user.admin?
		end
		if user.teams.length > 10
			user.errors[:teams] << "cannot be more than 10" unless user.admin?
		end
	end
end


class User < ApplicationRecord

	attr_accessor :activation_token

	has_many :teams, dependent: :destroy, inverse_of: :user
	has_many :students, through: :teams

	before_save{email.downcase!}
	before_create :create_activation_digest

	EMAIL_REGEX = /\A[\w+\-.]+@[\da-z\.\-]+\.[a-z]+\z/
	PHONE_REGEX = /\A\(?\d{3}\)?\s?\d{3}\-?\d{4}\z/
	has_secure_password

	# Required fields
	validates :name, presence: true
	validates :email, format: {with: EMAIL_REGEX}, uniqueness: true
	validates :phone, format: {with: PHONE_REGEX}

	include ActiveModel::Validations
	validates_with TeamValidator

	validates :school, presence: true

	validates :password, presence: true, length: {minimum: 7}, unless: :password_digest

	def admin?
		admin
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def activates?(token)
		BCrypt::Password.new(activation_digest).is_password?(token)
	end

	def redo_activation_digest
		create_activation_digest
		save
	end

	private
		def create_activation_digest
			self.activation_token = User.new_token
			self.activation_digest = User.digest(activation_token)
		end

end

