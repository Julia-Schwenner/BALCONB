class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @dogs = Dog.all
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
    #@user = current_user

    #@dog = Dog.new(dog_params)
    #@dog.user = @user
    #if @dog.save
     # redirect_to dogs_id_path
    #else
     #render :new
    #end
  end

  def update
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
