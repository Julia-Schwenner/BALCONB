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
    # @user = current_user

    # @meeting = Meeting.new(meeting_params)
    # @dog.user = @user
    # if @dog.save
    #   redirect_to dogs_path
    # else
    #   render :new
    # end
  end
end
