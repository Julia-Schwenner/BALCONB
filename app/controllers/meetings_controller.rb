class MeetingsController < ApplicationController
  def index
    #Find the user we're creating the meeting for
    #@user = User.find(params[:user_id])
    # Asssociate the dog and the user
    #@dog.user = @user
    # Display all the meetings

    @meetings = Meeting.all

    # @user_meetings = Meeting.where(user = current_user)
  end

  def new
    @meeting = Meeting.new
    set_dog
  end

  def create
    @user = current_user
    @price = @dog.price
    set_dog
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id
    @meeting.dog = @dog
    @meeting.price = @price
    if @meeting.save
      redirect_to meetings_path, notice: 'Added ingredient.'
    else
      render :new
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def meeting_params
    params.require(:meeting).permit(:dates, :price, :user_id, :dog_id, :start_time, :end_time)
  end
end
