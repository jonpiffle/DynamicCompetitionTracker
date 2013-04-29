class HangoutsController < ApplicationController
  autocomplete :player, :name, :display_value => :name_username, :extra_data => [:username]

  def starting_point
    @league = League.find(params[:league_id])
    @hangout = Hangout.find(params[:id])

    m = @hangout.matches.create
    g = m.game_sets.create
    redirect_to new_game_set_game_path(:game_set_id => g.id)
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
    @matches = @hangout.matches.finished
  end

  # POST /hangouts
  # POST /hangouts.json
  def create
    @league = League.find(params[:league_id])
    @hangout = @league.hangouts.build(params[:hangout])

    @hangout.player_names.split(", ").each do |p|
      @hangout.teams << Player.find_by_username(p.scan(/\((.*?)\)/)).solo
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

    params[:hangout][:player_names].split(", ").each do |p|
      @hangout.teams << Player.find_by_username(p.scan(/\((.*?)\)/)).solo
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
