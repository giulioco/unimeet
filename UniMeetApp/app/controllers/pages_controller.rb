class PagesController < ApplicationController
	before_action :authenticate_user! 
	def home
		@this_user = current_user
		@activity = Activity.find(7)
	end

	def like_activity
    @user = current_user
    @activity = Activity.find(params[:id])
    @user.like_activity!(@activity)
  end

  def dislike_activity
    @user = current_user
    @like = @user.likes.find_by_activity_id(params[:id])
    @activity = Activity.find(params[:id])
    @user.dislike_activity!(@activity)
  end
end
