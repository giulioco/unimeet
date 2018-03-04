class PagesController < ApplicationController
  layout 'application'
	before_action :authenticate_user! 



  def home
    @this_user = current_user
    session[:current_activity_id] = nil
    session[:is_swiping_as_user] = true
  end

  def show_card
    @activity = Activity.find(params[:id])
    respond_to do |format|               
      format.js
    end
  end

    def show_profile_card
    @user = User.find(params[:id])
    respond_to do |format|               
      format.js
    end
  end

  def show_edit_activity_card
    @activity = Activity.find(params[:id])
    respond_to do |format|               
      format.js
    end
  end

  def show_new_activity_card
    @activity = Activity.new
    respond_to do |format|               
      format.js
    end
  end

  def home_activity_perspective
    session[:current_activity_id] = params[:id]
    session[:is_swiping_as_user] = false
    render "pages/home_activity_perspective"
  end

  def like_activity
    @user = current_user
    @activity = Activity.find(params[:id])
    @itsMatch = @user.like_activity!(@activity)
    @all = Activity.all
    @notWanted = Activity.where(id: Activity.joins(:memberships).where({ "memberships.user_id" => current_user.id})).or(Activity.where(id: Activity.joins(:likes).where({"likes.user_id" => current_user.id}).where.not("likes.user_likes_activity" => nil)))
    @queue = @all - @notWanted
    if @queue.count > 0 
      @oldActivity = @activity
      @activity = @queue.first()
      if @itsMatch
        respond_to do |format|           
          format.js { render :action => "match_animation" }
        end
      end
      respond_to do |format|               
        format.js
      end
    else 
      @type = 'activity'
      respond_to do |format|           
        format.js { render :action => "empty_deck" }
      end
    end 
  end

  def dislike_activity
  @user = current_user
  @activity = Activity.find(params[:id])
  @user.dislike_activity!(@activity)
  @all = Activity.all
  @notWanted = Activity.where(id: Activity.joins(:memberships).where({ "memberships.user_id" => current_user.id})).or(Activity.where(id: Activity.joins(:likes).where({"likes.user_id" => current_user.id}).where.not("likes.user_likes_activity" => nil)))
  @queue = @all - @notWanted
  if @queue.count > 0 
    @activity = @queue.first()
    respond_to do |format|               
        format.js 
    end
  else 
      @type = 'activity'
      respond_to do |format|           
        format.js { render :action => "empty_deck" }
      end
  end 

  end

  def like_profile
    @user = User.find(params[:id])
    @activity = Activity.find(session[:current_activity_id])
    @itsMatch = @user.like_profile!(@user, @activity)
    @all = User.all
    @membersOfActivity = User.where(id: User.joins(:memberships).where("activity_id = ?", session[:current_activity_id])) 
    @usersIAlreadyLiked = User.where(id: User.joins(:likes).where("activity_id = ? AND activity_likes_user IS NOT NULL", session[:current_activity_id])) 
    @queue = @all - @membersOfActivity - @usersIAlreadyLiked 
    @oldUser = @user
    @user = @queue.first()
    puts @user.id 
    if @queue.count > 0 
      if @itsMatch
        respond_to do |format|           
          format.js { render :action => "match_animation_activity" }
        end
      end
      respond_to do |format|               
        format.js 
      end
    else 
      @type = 'user'
      respond_to do |format|           
        format.js { render :action => "empty_deck" }
      end
    end 
  end

  def dislike_profile
    @user = User.find(params[:id])
    @activity = Activity.find(session[:current_activity_id])
    @like = @activity.likes.find_by_activity_id(params[:id])
    @user.dislike_profile!(@user, @activity)
    @all = User.all
    @membersOfActivity = User.where(id: User.joins(:memberships).where("activity_id = ?", session[:current_activity_id])) 
    @usersIAlreadyLiked = User.where(id: User.joins(:likes).where("activity_id = ? AND activity_likes_user IS NOT NULL", session[:current_activity_id])) 
    @queue = @all - @membersOfActivity - @usersIAlreadyLiked 
    if @queue.count > 0
      @nextUserInQueue = @queue.first() 
      respond_to do |format|               
        format.js 
      end
    else 
      @type = 'user'
      respond_to do |format|           
        format.js { render :action => "empty_deck" }
      end
    end 
  end

  def unmatch_activity

  end

  def join_activity
    @activity = Activity.find(params[:id])
    current_user.join_activity!(params[:id])
    respond_to do |format|           
      format.js { render :action => "show_card" }
    end
  end

  def leave_activity
    @activity = Activity.find(params[:id])
    current_user.leave_activity!(params[:id])
    respond_to do |format|           
      format.js { render :action => "show_card" }
    end
  end

  def unmatch_profile

  end

end
