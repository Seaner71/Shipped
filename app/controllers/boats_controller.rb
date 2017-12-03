class BoatsController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_boat, only: [:edit, :update, :destroy]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = current_user.boats.new
  end

  def create
    # @boat = Boat.new(boat_params) //original one
    @boat = current_user.boats.new(boat_params)
    
    if @boat.save
      redirect_to boat_url(@boat)
    else
      render 'new'
    end
    end

    def edit
      @boat = Boat.find(params[:id])
    end

    def update
      @boat = Boat.find(params[:id])
      if @boat.update(boat_params)
      redirect_to boat_url(@boat)
    else
      render 'edit'
    end
  end

    def destroy
      @boat = Boat.find(params[:id])
      @boat.destroy
      redirect_to boats_path
    end

  private

  def boat_params
    params.require(:boat).permit(:avatar, :name, :country_code, :container_capacity, :user_id )
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def owned_boat
    @boat = Boat.find(params[:id])
  unless current_user == @boat.user
    flash[:alert] = "That post doesn't belong to you!"
    redirect_to boats_path
  end
end



end
