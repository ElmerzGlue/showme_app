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

	has_many :teams, dependent: :destroy, inverse_of: :user
	has_many :students, through: :teams

	before_save{email.downcase!}

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

end

