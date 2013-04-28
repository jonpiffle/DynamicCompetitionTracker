class GamesController < ApplicationController

  # GET /games
  # GET /games.json
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game_set = GameSet.find(params[:game_set_id])
    @match = @game_set.match
    @game = @game_set.games.build
    @hangout = @match.hangout
    @league = @match.league
    @teams = @league.structured ? @league.teams : @hangout.teams
    
    if @match.in_progress
      @team1 = @match.games.first.plays_ins.last.team.players.map(&:solo)
      @team2 = @match.games.first.plays_ins.first.team.players.map(&:solo)
    else
      @team1 = @team2 = @teams
    end

    @p1 = @game.plays_ins.build
    @p2 = @game.plays_ins.build

    @p1.build_scores(@league)
    @p2.build_scores(@league)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game_set = GameSet.find(params[:game_set_id])
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game_set = GameSet.find(params[:game_set_id])
    @game =  @game_set.games.build(params[:game])
    @match = @game_set.match
    @hangout = @match.hangout
    @league = @hangout.league

    if !@league.structured
      @game.plays_ins.each do |pi|
        team_name = pi.player_names.reject(&:blank?).sort.join(" & ")

        if t = Team.find_by_name(team_name)
          pi.team_id = t.id
        else
          t = Team.create(:name => team_name)
          pi.player_names.split(", ").each do |p|
            t.players << Player.find_by_username(p.scan(/\((.*?)\)/))
          end
          pi.team_id = t.id
          @league.registrations.create(:team_id => t.id)
        end
      end
    end


    respond_to do |format|
      if @game.save
        if @game_set.set_winner
          if @match.set_winner
            if @league.structured
              format.html { redirect_to @league, :notice => "#{@game.winner.name} won!"}
            else
              format.html { redirect_to edit_league_hangout_path(:league_id => @league.id, :id => @hangout), :notice => "#{@game.winner.name} won!"}
            end
          else
            format.html { redirect_to edit_match_path(@match), :notice => "#{@game.winner.name} won the set!"}
          end
        else
          format.html { redirect_to edit_game_set_path(@game_set), :notice => "#{@game.winner.name} won the game!"}
        end
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, :notice => 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
