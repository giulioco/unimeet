class PagesController < ApplicationController
	def home
		if !user_signed_in?
		   #visit root_path
		end
	end
end
