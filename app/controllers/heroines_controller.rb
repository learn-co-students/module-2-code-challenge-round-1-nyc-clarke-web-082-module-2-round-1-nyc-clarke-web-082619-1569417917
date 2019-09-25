class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show, :edit, :update]

  def index
    @heroines = Heroine.all
    render :index
  end

  def show 
    render :show
  end 

  def new 
    @heroine = Heroine.new 
    render :new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    redirect_to heroine_path(@heroine)
  end

  def edit 
    render :edit 
  end 

  def update 
    @heroine.update(heroine_params)
    redirect_to heroine_path(@heroine)
  end 

  private 

    def find_heroine 
      @heroine = Heroine.find(params[:id])
    end 

    def heroine_params 
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end 

end

#  def create 
#   if @heroine.valid? 
#   @heroine.save 
#   redirect_to heroine_path(@heroine)
#   else 
#   redirect_to new_heroine_path
