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
        flash[:errors] = @heroine.errors.full_messages
        render :new
      end
    end

    def search
      @heroines = Heroine.all.select do |heroine|
        heroine.power.id == params["power"]["q"].to_i
      end

      @selected_power = Power.find(params["power"]["q"].to_i)
      render :search
    end
end
