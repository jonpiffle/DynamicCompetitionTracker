class GameSetsController < ApplicationController

  # GET /game_sets
  # GET /game_sets.json
  def index
    @game_sets = GameSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @game_sets }
    end
  end

  # GET /game_sets/1
  # GET /game_sets/1.json
  def show
    @game_set = GameSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @game_set }
    end
  end

  # GET /game_sets/new
  # GET /game_sets/new.json
  def new
    @game_set = GameSet.new
    @match = @game_set.match
    @games = @game_set.games

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @game_set }
    end
  end

  # GET /game_sets/1/edit
  def edit
    @game_set = GameSet.find(params[:id])
    @match = @game_set.match
    @games = @game_set.games
  end

  # POST /game_sets
  # POST /game_sets.json
  def create
    @game_set = GameSet.new(params[:game_set])

    respond_to do |format|
      if @game_set.save
        format.html { redirect_to @game_set, :notice => 'Game set was successfully created.' }
        format.json { render :json => @game_set, :status => :created, :location => @game_set }
      else
        format.html { render :action => "new" }
        format.json { render :json => @game_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /game_sets/1
  # PUT /game_sets/1.json
  def update
    @game_set = GameSet.find(params[:id])

    respond_to do |format|
      if @game_set.update_attributes(params[:game_set])
        format.html { redirect_to @game_set, :notice => 'Game set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /game_sets/1
  # DELETE /game_sets/1.json
  def destroy
    @game_set = GameSet.find(params[:id])
    @game_set.destroy

    respond_to do |format|
      format.html { redirect_to game_sets_url }
      format.json { head :no_content }
    end
  end
end
