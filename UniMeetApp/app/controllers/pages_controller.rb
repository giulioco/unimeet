class PagesController < ApplicationController
  layout 'application'
	before_action :authenticate_user! 
  protect_from_forgery except: :show_card
  before_action :verify_activity_exists, only: [:home_activity_perspective]
  before_action :verify_project_owner, only: [:home_activity_perspective]

  def home
    @this_user = current_user
    session[:current_activity_id] = nil
    session[:is_swiping_as_user] = true
    session[:is_swiping] = true
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

  def show_edit_profile_card
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

  def show_chat
    puts params[:id]
    @chatroom = Chatroom.find_by(activity_id: params[:id])
    @message = Message.new
    puts @chatroom.inspect
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
    @queue = Activity.queue(current_user.id)
    if @queue.count > 0 
      @oldActivity = @activity
      @importantActivity = @activity
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
      @oldActivity = @activity
      if @itsMatch
        respond_to do |format|           
          format.js { render :action => "match_animation_empty_deck" }
        end
        return
      else
        respond_to do |format|           
          format.js { render :action => "empty_deck" }
        end
      end
    end 
  end

  def dislike_activity
  @user = current_user
  @activity = Activity.find(params[:id])
  @user.dislike_activity!(@activity)
  @queue = Activity.queue(current_user.id)
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
    @queue = User.queue(session[:current_activity_id])
    if @queue.count > 0 
      @oldUser = @user
      @user = @queue.first()
      if @itsMatch
        respond_to do |format|           
          format.js { render :action => "match_animation_activity" }
        end
      else
        respond_to do |format|               
          format.js 
        end
      end
    else 
      @type = 'user'
      if @itsMatch
        respond_to do |format|           
          format.js { render :action => "match_animation_empty_deck" }
        end
        return
      else
        respond_to do |format|           
          format.js { render :action => "empty_deck" }
        end
      end
    end 
  end

  def dislike_profile
    @user = User.find(params[:id])
    @activity = Activity.find(session[:current_activity_id])
    @like = @activity.likes.find_by_activity_id(params[:id])
    @user.dislike_profile!(@user, @activity)
    @queue = User.queue(session[:current_activity_id])
    if @queue.count > 0
      @oldUser = @user
      @user = @queue.first() 
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
    @oldId = params[:id]
    Match.where(user_id: current_user.id, activity_id: params[:id]).destroy_all
    @queue = Activity.queue(current_user.id)
    if @queue.count > 0
      @nextInQueue = @queue.first
      respond_to do |format|           
        format.js 
      end
    else 
      @type = 'activity'
      respond_to do |format|           
        format.js { render :action => "empty_deck_after_unmatch" }
      end
    end
  end

  def join_activity
    @activity = Activity.find(params[:id])
    current_user.join_activity!(params[:id])
    @activity.team_count = @activity.team_count + 1
    @activity.save
    respond_to do |format|           
      format.js 
    end
  end

  def leave_activity
    @activity_id = params[:id]
    @activity = Activity.find(@activity_id)
    Membership.where(user_id: current_user.id, activity_id: params[:id], ownership: false).destroy_all
    @activity.team_count = @activity.team_count - 1
    @activity.save
    #current_user.leave_activity!(params[:id])
    respond_to do |format|           
      format.js
    end
  end

  def unmatch_profile
    @oldId = params[:id]
    Match.where(user_id: params[:id], activity_id: session[:current_activity_id]).destroy_all
    @queue = User.queue(session[:current_activity_id])
    if @queue.count > 0
      @nextInQueue = @queue.first
      respond_to do |format|           
        format.js 
      end
    else 
      @type = 'user'
      respond_to do |format|           
        format.js { render :action => "empty_deck_after_unmatch" }
      end
    end
  end

  def open_notification
    #check notification as open
    #render new page
    
  end

  def back_to_swipe
    puts "The user is swiping as an activity:"
    puts session[:is_swiping_as_user].inspect
    if not session[:is_swiping_as_user] 
      @queue = User.queue(session[:current_activity_id])
      if @queue.count > 0 
        @oldUser = @user
        @user = @queue.first()
        respond_to do |format|               
          format.js { render :action => "back_to_swipe_profile" }
        end
      else 
        @type = 'user'
        respond_to do |format|           
          format.js { render :action => "empty_deck" }
        end
      end
    else
      @queue = Activity.queue(current_user.id)
      if @queue.count > 0 
        @oldActivity = @activity
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
  end

  def close_chatroom
    respond_to do |format|               
        format.js 
    end
  end
  
  private

  def verify_project_owner
    @activity = Activity.find(params[:id])
    if current_user.id != @activity.project_owner_id
      redirect_to authenticated_root_path
    end 
  end
  def verify_activity_exists
    if not Activity.where(id: params[:id]).exists?
      redirect_to authenticated_root_path
    end
  end
end
