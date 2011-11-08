class EventsController < ApplicationController
  
  before_filter :authenticate_user!, :except => ['new', 'create', 'confirm']
  
  # GET /events
  # GET /events.json
  def index
    # @events = Event.order('created_at desc').limit(15)
    @events = Event.by_site( current_user.sites )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  
  def pending
    @events = Event.by_site( current_user.sites ).pending
  end
  
  def approved
    @events = Event.by_site( current_user.sites ).approved
  end
  
  def denied
    @events = Event.by_site( current_user.sites ).denied
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end
  
  # GET /events/1/confirm
  # GET /events/1/confirm.json
  def confirm
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @needs = Need.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @needs = Need.all
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        EventMailer.confirmation_email(@event).deliver
        if @event.site.users.any?
          EventMailer.approval_notice(@event).deliver
        end
        if @event.needs.any?
          EventMailer.staff_notice(@event).deliver
        end
        
        format.html { redirect_to '/thank_you.html', notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
  
  def approve
    @event = Event.find(params[:id])
    if @event.approve
      EventMailer.approved_notice(@event).deliver
      redirect_to events_path, notice: 'Event approved.'
    else
      render action: "index", notice: 'There was a problem approving that event.'
    end
  end
  
  def edit_denial
    @event = Event.find(params[:id])
  end
  
  def deny
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      if @event.deny
        EventMailer.denied_notice(@event).deliver
        redirect_to events_path, notice: 'Event denied.'
      else
        render action: "edit_denial"
      end
    else
      render action: "edit_denial"
    end
  end
end
