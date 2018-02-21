class PagesController < ApplicationController
  layout 'application'
	before_action :authenticate_user! 
  def home
    @this_user = current_user
    @activity = Activity.find(56)
    session[:current_activity_id] = nil
    session[:is_swiping_as_user] = true
  end

  def home_activity_perspective
    @user = User.find(1)
    session[:current_activity_id] = params[:id]
    session[:is_swiping_as_user] = false
    render "pages/home_activity_perspective"
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

  def like_profile
    @user = User.find(params[:id])
    @activity = Activity.find(session[:current_activity_id])
    @user.like_profile!(@user, @activity)
  end

  def dislike_profile
    @user = User.find(params[:id])
    @activity = Activity.find(session[:current_activity_id])
    @like = @activity.likes.find_by_activity_id(params[:id])
    @user.dislike_profile!(@user, @activity)
  end
end
