class MeetingsController < ApplicationController
  def index
    @user_meetings = Meetings.all #where @user = current_user
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
