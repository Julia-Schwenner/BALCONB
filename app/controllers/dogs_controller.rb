class DogsController < ApplicationController

      
        #def show
        #end
      
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

        private
      
        #strong params
        def dog_params
          params.require(:dog).permit(:name, :address, :description, :price)
        end

end 

