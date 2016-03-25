class User < ActiveRecord::Base
	has_many :articles
	before_save { self.email=email.downcase}
	validates :username,presence: true,uniqueness:{ case_sensitive: false},
			   length: { minimum: 5, maximum: 10}
	validates :email,presence: true,length: { maximum: 105},
			   uniqueness: { case_sensitive: false},
			   format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end