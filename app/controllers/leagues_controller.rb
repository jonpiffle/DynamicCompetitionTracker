class LeaguesController < ApplicationController
  autocomplete :team, :name

  #if structured, build session automatically and go to game/set/match screen
  #if unstructured, go to game set/match/screen
  def starting_point
    @league = League.find(params[:id])

    if @league.structured
      h = @league.hangouts.create
      redirect_to starting_point_league_hangout_path(:league_id => @league.id, :id => h.id)
    else
      redirect_to new_league_hangout_path(:league_id => @league.id)
    end
  end

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @leagues }
    end
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id])
    @teams = @league.teams

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @league }
    end
  end

  # GET /leagues/new
  # GET /leagues/new.json
  def new
    @league = League.new
    @competitions = Competition.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @league }
    end
  end

  # GET /leagues/1/edit
  def edit
    @league = League.find(params[:id])
    @competitions = Competition.all
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(params[:league])

    respond_to do |format|
      if @league.save
        format.html { redirect_to @league, :notice => 'League was successfully created.' }
        format.json { render :json => @league, :status => :created, :location => @league }
      else
        format.html { render :action => "new" }
        format.json { render :json => @league.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leagues/1
  # PUT /leagues/1.json
  def update
    @league = League.find(params[:id])

    respond_to do |format|
      if @league.update_attributes(params[:league])
        format.html { redirect_to @league, :notice => 'League was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @league.errors, :status => :unprocessable_entity }
      end
    end
  end

  def add_teams
    @league = League.find(params[:id])
    @teams = @league.teams
  end

  def save_teams
    @league = League.find(params[:id])

    params[:league][:teams_names].split(", ").each do |t|
      puts t
      @league.registrations.create(:team_id => Team.find_by_name(t).id)
    end

    respond_to do |format|
      format.html { redirect_to @league, :notice => 'Teams were succesfully added.' }
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league = League.find(params[:id])
    @league.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url }
      format.json { head :no_content }
    end
  end
end
