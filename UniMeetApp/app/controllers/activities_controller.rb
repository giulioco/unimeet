class ActivitiesController < ApplicationController
  def show
    @activity = Activities.find(params[:id])
  end

  def edit
  	@activity = Activities.find(params[:id])
  end

  def new
  	@activity = Activities.new
  	respond_to do |format|
    	format.html  # new.html.erb
    	format.json  { render :json => @activity }
  	end
  end

  def update
  	@activity = Activities.find(params[:id])
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
  @activity = Activities.new(params[:post])
 
  respond_to do |format|
    if @activity.save
      format.html  { redirect_to(@activity,
                    :notice => 'Activity was successfully created.') }
      format.json  { render :json => @activity,
                    :status => :created, :location => @activity }
    else
      format.html  { render :action => "new" }
      format.json  { render :json => @activity.errors,
                    :status => :unprocessable_entity }
    end
  end
  end
end
