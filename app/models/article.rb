class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true,uniqueness: { case_sensitive: false},length: { minimum: 5, maximum: 10}
	validates :description,presence: true,length: { minimum: 15, maximum: 100} 
	validates :user_id,presence: true
end
