<<<<<<< HEAD
class PagesController < ApplicationController
	before_action :authenticate_user! 
	def home
		@this_user = current_user
		@activity = Activity.find(1)
	end
end
=======
class PagesController < ApplicationController
	before_action :authenticate_user! 
	def home
		@this_user = current_user
		@activity = Activity.find(1)
	end

	def like_activity
		puts "like function called! :)"
	end

	def dislike_activity
		puts "dislike function called! :)"
	end
end
>>>>>>> 4ec6fd5249b0f7a0cc2cdcce0c58546f4707720f
