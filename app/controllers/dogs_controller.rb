class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @dogs = Dog.all

        #map
        @dogs = Dog.geocoded
        @markers = @dogs.map do |dog|
          {
            lat: dog.latitude,
            lng: dog.longitude
          }

        #city search
          if params[:query].present?
            @dogs = Dog.where('address ILIKE ?', "%#{params[:query]}%")
          else
            @dogs = Dog.all
          end
  

          #price filtering
            if params[:price] == 'below 10'
              @dogs = Dog.where("price < 10")
            elsif params[:price] == 'below 5'
              @dogs = Dog.where("price < 5")
            elsif params[:price] == 'free'
              @dogs = Dog.where("price = 0")
            else
              @dogs = Dog.all
            end
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