class ScoreTypesController < ApplicationController
  # GET /score_types
  # GET /score_types.json
  def index
    @competition = Competition.find(params[:competition_id])
    @score_types = @competition.score_types

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @score_types }
    end
  end

  # GET /score_types/1
  # GET /score_types/1.json
  def show
    @competition = Competition.find(params[:competition_id])
    @score_type = ScoreType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @score_type }
    end
  end

  # GET /score_types/new
  # GET /score_types/new.json
  def new
    @competition = Competition.find(params[:competition_id])
    @score_type = @competition.score_types.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @score_type }
    end
  end

  # GET /score_types/1/edit
  def edit
    @competition = Competition.find(params[:competition_id])
    @score_type = ScoreType.find(params[:id])
  end

  # POST /score_types
  # POST /score_types.json
  def create
    @competition = Competition.find(params[:competition_id])
    @score_type = @competition.score_types.build(params[:score_type])

    respond_to do |format|
      if @score_type.save
        format.html { redirect_to competition_score_type_path(@competition, @score_type), :notice => 'Score type was successfully created.' }
        format.json { render :json => @score_type, :status => :created, :location => @score_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @score_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /score_types/1
  # PUT /score_types/1.json
  def update
    @competition = Competition.find(params[:competition_id])
    @score_type = ScoreType.find(params[:id])

    respond_to do |format|
      if @score_type.update_attributes(params[:score_type])
        format.html { redirect_to competition_score_type_path(:competition_id => @competition.id, :id => @score_type.id), :notice => 'Score type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @score_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /score_types/1
  # DELETE /score_types/1.json
  def destroy
    @competition = Competition.find(params[:competition_id])
    @score_type = ScoreType.find(params[:id])
    @score_type.destroy

    respond_to do |format|
      format.html { redirect_to @competition }
      format.json { head :no_content }
    end
  end
end
