class HeroinesController < ApplicationController
  
 
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    @heroine.save

    redirect_to @heroine
  end

   #def search
   # @heroines = Heroine.all
   # @heroines = @heroines.search(params[:search]) if params[:search].present?
   #end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
