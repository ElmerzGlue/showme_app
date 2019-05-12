class User < ApplicationRecord
	validates :name, presence: true
	EMAIL_REGEX = /\A[\w+\-.]+@[\da-z\.\-]+\.[a-z]+\z/
	validates :email, format: {with: EMAIL_REGEX}
	validates :school, presence: true
	has_secure_password
	validates :password, presence: true, length: {minimum: 8}
end
