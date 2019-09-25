class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
      @power = Power.find_by(name: params[:search])
    if @power != nil
      @heroines_with_power = Heroine.where(power_id: @power.id)
    end
  end

  def new
    @heroine = Heroine.new
    render :new
  end

  def create
    @heroine  = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
    render :show
  end

  # def search 
  #   @heroines_with_power = Heroine.find_by(power_id: params[:power][:id])
  #   redirect_to heroines_path
  # end


  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end

end
