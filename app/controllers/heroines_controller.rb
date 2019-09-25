class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    # if params.key?(:q)
    #   @H = @heroines.select{|heroine| heroine.power.name == params[:q]}
    #   @heroines = @H
    # end
  end

  def new
    @heroine = Heroine.new
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash[:error] = "Error: Heroines must have unique Super Names!"
      render :new
    end
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
