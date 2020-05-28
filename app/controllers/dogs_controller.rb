class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @dogs = Dog.all

    @dogs = Dog.geocoded
    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude
      }
    end
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @user = current_user
    @dog = Dog.new(dog_params)
    @dog.user = @user
    if @dog.save
      redirect_to dogs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @dog.update(dog_params)
        redirect_to dog_path(@dog)
      else
        render :edit
      end
  end


  def destroy
    @dogs = Dog.find(params[:id])
    @dogs.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to dogs_path
  end

  private

  #strong params
  def dog_params
    params.require(:dog).permit(:name, :address, :description, :price)
  end

  def set_dog
  @dog = Dog.find(params[:id])
  end

end
