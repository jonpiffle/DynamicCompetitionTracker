class SessionsController < ApplicationController
  autocomplete :team, :name

  def get_autocomplete_items(parameters)
    @league = League.find(params[:league_id])
    puts parameters
    @league.teams.where("name LIKE '%#{parameters[:term]}%'")
  end

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @league = League.find(params[:league_id])
    @session = @league.sessions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @league = League.find(params[:league_id])
    @session = @league.sessions.build(params[:session])

    respond_to do |format|
      if @session.save
        format.html { redirect_to league_session_path(:league_id => @league.id, :session_id => @session.id), :notice => 'Session was successfully created.' }
        format.json { render :json => @session, :status => :created, :location => @session }
      else
        format.html { render :action => "new" }
        format.json { render :json => @session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to @session, :notice => 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = Session.find(params[:id])
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end
end
