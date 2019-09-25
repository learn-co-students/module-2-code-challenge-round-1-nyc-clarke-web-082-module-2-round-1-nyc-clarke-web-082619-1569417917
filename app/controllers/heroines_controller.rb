class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    if params.key?(:q)
      @H = @heroines.select{|heroine| heroine.power.name == params[:q]}
      @heroines = @H
    end
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
      flash.now[:error] = "Error: Heroines must have a non-empty unique Super Name!"
      render :new
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    if @heroine.update(heroine_params)
      redirect_to @heroine
    else
      flash.now[:error] = "Error: Heroines must have a non-empty unique Super Name!"
      render :edit
    end
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
