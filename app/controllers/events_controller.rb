class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_event, except: [:index, :new, :create]
  before_action :move_out_of_user, only: [:edit, :update, :destroy]

  def index
    @events = Event.order('created_at DESC') # .includes(:user)
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

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end
end

private

def event_params
  params.require(:event).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                :gender_id, :anniversary_date, :category_id, :anniversary_name)
        .merge(user_id: current_user.id)
end

def set_event
  @event = Event.find(params[:id])
end

def move_out_of_user
  redirect_to root_path unless current_user.id == @event.user.id
end
