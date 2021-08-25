class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @events = Event.order("created_at DESC") #.includes(:user)
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
  params.require(:event).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                :gender_id, :anniversary_date, :category_id, :anniversary_name)
                        .merge(user_id: current_user.id)
end