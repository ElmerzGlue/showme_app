class User < ApplicationRecord

	before_save{email.downcase!}


	EMAIL_REGEX = /\A[\w+\-.]+@[\da-z\.\-]+\.[a-z]+\z/
	PHONE_REGEX = /\A\(?\d{3}\)?\s?\d{3}\-?\d{4}\z/
	has_secure_password

	# Required fields
	validates :name, presence: true
	validates :email, format: {with: EMAIL_REGEX}, uniqueness: true
	validates :phone, format: {with: PHONE_REGEX}

	validates :school, presence: true
	validates :teams, presence: true, numericality: {greater_than: 0}

	validates :password, presence: true, length: {minimum: 7}

	# Optional fields
	# coach_name, no validation
	# validates :coach_email, format: {with: EMAIL_REGEX}, allow_nil: true
	# validates :coach_phone, format: {with: PHONE_REGEX}, allow_nil: true

	def admin?
		admin
	end

end
