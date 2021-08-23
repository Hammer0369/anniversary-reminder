class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def event_params
  params.require(:event).permit(:name, :gender_id, :anniversary_date, :category_id, :anniversary_name)
                        .merge(user_id: current_user.id)
end