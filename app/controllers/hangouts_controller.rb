class HangoutsController < ApplicationController
  autocomplete :team, :name

  def get_autocomplete_items(parameters)
    @league = League.find(params[:league_id])
    @league.teams.where("name LIKE '%#{parameters[:term]}%'")
  end

  def starting_point
    @league = League.find(params[:league_id])
    @hangout = Hangout.find(params[:id])

    if @league.sets_per_match == 1
      m = @hangout.matches.create
      if @league.games_per_set == 1
        g = m.game_sets.create
        redirect_to new_game_set_game_path(:game_set_id => g.id)
      else
        g = m.game_sets.create
        redirect_to edit_match_game_set_path(:match_id => m.id, :id => g.id)
      end
    else
        m = @hangout.matches.create
        redirect_to edit_match_path(:id => m.id)
    end
  end

  # GET /hangouts
  # GET /hangouts.json
  def index
    @league = League.find(params[:league_id])
    @hangouts = @league.hangouts
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hangouts }
    end
  end

  # GET /hangouts/1
  # GET /hangouts/1.json
  def show
    @league = League.find(params[:league_id])
    @hangout = Hangout.find(params[:id])
    @teams = @hangout.teams

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hangout }
    end
  end

  # GET /hangouts/new
  # GET /hangouts/new.json
  def new
    @league = League.find(params[:league_id])
    @hangout = @league.hangouts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hangout }
    end
  end

  # GET /hangouts/1/edit
  def edit
    @hangout = Hangout.find(params[:id])
    @league = @hangout.league
    @teams = @hangout.teams
  end

  # POST /hangouts
  # POST /hangouts.json
  def create
    @league = League.find(params[:league_id])
    @hangout = @league.hangouts.build(params[:hangout])

    @hangout.teams_names.split(", ").each do |p|
      @hangout.teams << Team.find_by_name(p)
    end

    respond_to do |format|
      if @hangout.save
        format.html { redirect_to edit_league_hangout_path(:league_id => @league.id, :id => @hangout.id), :notice => 'Hangout was successfully created.' }
        format.json { render :json => @hangout, :status => :created, :location => @hangout }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hangout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hangouts/1
  # PUT /hangouts/1.json
  def update
    @hangout = Hangout.find(params[:id])
    @league = @hangout.league

    params[:hangout][:teams_names].split(", ").each do |p|
      @hangout.teams << Team.find_by_name(p)
    end

    respond_to do |format|
      if @hangout.update_attributes(params[:hangout])
        format.html { redirect_to edit_league_hangout_path(:league_id => @league.id, :id => @hangout.id), :notice => 'Hangout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hangout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hangouts/1
  # DELETE /hangouts/1.json
  def destroy
    @hangout = Hangout.find(params[:id])
    @league = League.find(params[:league_id])
    @hangout.destroy

    respond_to do |format|
      format.html { redirect_to league_hangouts_path(:league_id => @league.id) }
      format.json { head :no_content }
    end
  end
end
