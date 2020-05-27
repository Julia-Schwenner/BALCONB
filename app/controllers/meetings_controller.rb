class MeetingsController < ApplicationController
  def index
    #Find the user we're creating the meeting for
    #@user = User.find(params[:user_id])
    # Asssociate the dog and the user
    #@dog.user = @user
    # Display all the meetings
    @meeting = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @user = current_user
    set_dog
    @meeting = Meeting.new(meeting_params)
    @meeting.user = @user
    @meeting.dog = @dog
    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

private

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
