class FoodsController < ApplicationController
  def index
    @foods = Food.all
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
end
