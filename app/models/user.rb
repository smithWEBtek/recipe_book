class User < ActiveRecord::Base
	has_secure_password
	has_many :recipes
	has_many :comments
	has_many :ingredients, through: :recipes
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :password_digest, :presence => true, 
			    :unless => :has_password?

	def has_password?
		!self.password_digest.blank?
	end
	

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.password = SecureRandom.urlsafe_base64
			user.save!
		end
	end
end