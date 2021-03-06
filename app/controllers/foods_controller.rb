class FoodsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @foods = Food.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:page => params[:page], :per_page => 5)
    @activities = Activity.search(params[:search_a]).order(sort_column_a+" "+sort_direction_a).paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @food = Food.new

  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    @food.save
    respond_to do |format|
      format.html { redirect_to foods_url }
      format.js
    end
  end

  def edit
    @food = Food.find(params[:id])
    render 'edit'
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to foods_path
    else
      render 'edit'
    end
  end

  def destroy
    @food = Food.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to foods_url }
      format.js
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :calories)
  end

  def sort_column
    Food.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column_a
    Activity.column_names.include?(params[:sort_a]) ? params[:sort_a] : "name"
  end

  def sort_direction_a
    %w[asc desc].include?(params[:direction_a]) ? params[:direction_a] : "asc"
  end
end
