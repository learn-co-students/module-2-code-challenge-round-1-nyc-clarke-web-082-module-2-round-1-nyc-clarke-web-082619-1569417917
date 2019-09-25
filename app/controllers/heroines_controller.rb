class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]
  def index
    @heroines = Heroine.all
    @power_filter = params[:power_filter]

    if @power_filter
      @power_filter.strip!
      if @power_filter.length > 0
        @heroines = Heroine.filtered_by_power(@power_filter)
      end
    end
  end

  def show
  
  end

  def new
    @heroine = Heroine.new
    @powers= Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      redirect_to new_heroine_path
    end
  end

  private
  
  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
