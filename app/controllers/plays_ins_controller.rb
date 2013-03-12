class PlaysInsController < ApplicationController
  # GET /plays_ins
  # GET /plays_ins.json
  def index
    @plays_ins = PlaysIn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @plays_ins }
    end
  end

  # GET /plays_ins/1
  # GET /plays_ins/1.json
  def show
    @plays_in = PlaysIn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @plays_in }
    end
  end

  # GET /plays_ins/new
  # GET /plays_ins/new.json
  def new
    @plays_in = PlaysIn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @plays_in }
    end
  end

  # GET /plays_ins/1/edit
  def edit
    @plays_in = PlaysIn.find(params[:id])
  end

  # POST /plays_ins
  # POST /plays_ins.json
  def create
    @plays_in = PlaysIn.new(params[:plays_in])

    respond_to do |format|
      if @plays_in.save
        format.html { redirect_to @plays_in, :notice => 'Plays in was successfully created.' }
        format.json { render :json => @plays_in, :status => :created, :location => @plays_in }
      else
        format.html { render :action => "new" }
        format.json { render :json => @plays_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plays_ins/1
  # PUT /plays_ins/1.json
  def update
    @plays_in = PlaysIn.find(params[:id])

    respond_to do |format|
      if @plays_in.update_attributes(params[:plays_in])
        format.html { redirect_to @plays_in, :notice => 'Plays in was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @plays_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plays_ins/1
  # DELETE /plays_ins/1.json
  def destroy
    @plays_in = PlaysIn.find(params[:id])
    @plays_in.destroy

    respond_to do |format|
      format.html { redirect_to plays_ins_url }
      format.json { head :no_content }
    end
  end
end
