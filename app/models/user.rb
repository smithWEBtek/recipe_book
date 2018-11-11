class User < ActiveRecord::Base
	has_secure_password
	has_many :recipes
	has_many :comments
	has_many :ingredients, through: :recipes
	validates :name, presence: true, length: { maximum: 12 }
	validates :name, uniqueness: true
	validates :password_digest, :presence => true, 
	:confirmation => true,
	:length => { minimum: 8},
	:unless => :has_password?


	def has_password?
		!self.password_digest.blank?
	end

 	def self.create_with_omniauth(auth)
    	create! do |user|
      	user.uid = auth["uid"]
      	user.name = auth["info"]["name"]
    	end
  	end

end