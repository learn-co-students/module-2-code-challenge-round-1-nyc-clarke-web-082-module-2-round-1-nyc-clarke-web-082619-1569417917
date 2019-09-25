class PowersController < ApplicationController
  before_action :find_power, only: [:show]
  def index
    @powers = Power.all
  end

  def show
  
  end

  private
  
  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end
end
