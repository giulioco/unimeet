class ActivitiesController < ApplicationController
  def show
    @activity = Activities.find(params[:id])
  end

  def edit
  end

  def update
  end
end
