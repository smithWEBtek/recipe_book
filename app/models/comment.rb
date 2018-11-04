class Comment < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :user
	validates_presence_of :content
	validates_presence_of :title

	def self.valid_entry(params)
    	return !params[:recipe][:comment][:title].empty? && !params[:recipe][:comment][:content].empty? 
    end
end