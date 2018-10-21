module ApplicationHelper
	def errors(method)
    	object.errors.full_messages_for(method).map { |m| help_block(m) }.join.html_safe
  	end
end
