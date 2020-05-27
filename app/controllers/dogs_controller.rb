class DogsController < ApplicationController
before_action :set_dog, only: [:show]
skip_before_action :authenticate_user!, only: :index

  def index
    @dogs = Dog.all
  end

  # def show
  # end
  def destroy
    @dogs = Dog.find(params[:id])
    @dogs.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to dogs_path
  end

  private

  # def set_dog
  #   @dog = Dog.find(params[:id])
  # end

  # def cocktails_params
  #   params.require(:dog).permit(:name, :address, )
  #   # later :photo
  # end
end
