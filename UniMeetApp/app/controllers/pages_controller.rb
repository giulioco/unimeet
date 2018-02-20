class PagesController < ApplicationController
	before_action :authenticate_user! 
	def home
		@this_user = current_user
		@activity = Activity.find(1)
	end
end
