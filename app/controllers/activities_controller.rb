ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activities_path
    else
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to activities_url }
      format.js
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :calories)
  end

end
