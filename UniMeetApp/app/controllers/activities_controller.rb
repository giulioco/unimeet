class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  def show
    @activity = Activity.find(params[:id])
  end

  def edit
  	@activity = Activity.find(params[:id])
  end

  def new
  	@activity = Activity.new
  	respond_to do |format|
    	format.html # new.html.erb
    	format.json  { render :json => @activity }
  	end
  end

  def update
  	@activity = Activity.find(params[:id])
  	if @activity.update(params[:activity].permit(:title, :text))
    	redirect_to @activity
    else 
    	render 'edit'
    end
  end

  def destroy
  	@activity = activity.find(params[:id])
  	@activity.destroy
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.users << current_user
    @activity.project_owner_id = current_user.id
    respond_to do |format|
      if @activity.save
        membership = current_user.memberships.find_by(activity_id: @activity.id)
        membership.ownership = true
        membership.save
        format.html  { redirect_to action: 'show', :id => @activity.id }
        format.json  { render :json => @activity,
                      :status => :created, :location => @activity }
      else

        format.html  { render :action => "new" }
        format.json  { render :json => @activity.errors,
                      :status => :unprocessable_entity }
      end
    end

  end

  def activity_params
      params.require(:activity).permit(:name, :description, :max_size, :image)
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
