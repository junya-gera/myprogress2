class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    # @events = event.includes(:user)
    @user = User.find(params[:user_id])
    event_datas = Event.where(user_id: params[:user_id])

    @datas= [];
    event_datas.each do |data|
      @datas += [
        'title' => data[:title],
        'content' => data[:content],
        'start' => data[:start_date],
        'end' => data[:end_date],
        'url' => "/users/#{@user.id}/events/#{data[:id]}",
        'color' => '#98d6ea',
        'textColor' => 'black',
        'borderColor' => '#007bff'
      ]
    end
    @puzzles = Puzzle.where(user_id: current_user)
    if @puzzles == []
      9.times do
        Puzzle.create(user_id: @user.id)
      end
    end

  end

  # GET /events/1
  # GET /events/1.json
  def show
    
  end

  # GET /events/new
  def new
    @event = Event.new
    @events = Event.where(user_id: current_user)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to new_user_event_path(current_user), notice: 'event was successfully created.' }
        format.json
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to user_events_path(current_user), notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to new_user_event_path(current_user), notice: 'event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :content, :start_date, :end_date).merge(user_id: current_user.id)
    end
end
