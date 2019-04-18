class User < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	EMAIL_REGEX = /\A[\w+\-.]+@[\da-z\.\-]+\.[a-z]+\z/
	validates :email, format: {with: EMAIL_REGEX}
	validates :school, presence: true
end
