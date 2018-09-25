class User < ActiveRecord::Base
	has_secure_password
	has_many :recipes
	has_many :ingredients, through: :recipes
	validates :name, presence: true, length: { maximum: 12 }
	validates :name, uniqueness: true
	validates :password_digest, :presence => true, 
								:confirmation => true,
								:length => { minimum: 8},
	                       		:unless => :has_password?

	private

	def has_password?
    	!self.password_digest.blank?
  	end

end

  