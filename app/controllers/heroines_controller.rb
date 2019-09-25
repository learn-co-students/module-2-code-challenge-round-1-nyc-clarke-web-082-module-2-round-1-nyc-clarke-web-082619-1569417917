class HeroinesController < ApplicationController
    def index
      @heroines = Heroine.all
    end

    def new
      @heroine = Heroine.new
    end

    def show
    @heroine = Heroine.find(params[:id])
    end

    def create
    @heroine = Heroine.create(params.require(:heroine).permit(:name, :super_name, :power_id))
      if @heroine.save
        redirect_to @heroine
      else
        render :new
      end
    end
end
