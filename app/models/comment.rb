class Comment < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :user
	validates_presence_of :content
	validates_presence_of :title
end