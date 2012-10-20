class CampanhasController < ApplicationController
  before_filter :authenticate_usuario!
  layout "admin"
  
  # GET /campanhas
  # GET /campanhas.json
  def index
    @campanhas = Campanha.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campanhas }
    end
  end

  # GET /campanhas/1
  # GET /campanhas/1.json
  def show
    @campanha = Campanha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campanha }
    end
  end

  # GET /campanhas/new
  # GET /campanhas/new.json
  def new
    @campanha = Campanha.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campanha }
    end
  end

  # GET /campanhas/1/edit
  def edit
    @campanha = Campanha.find(params[:id])
  end

  # POST /campanhas
  # POST /campanhas.json
  def create
    @campanha = Campanha.new(params[:campanha])

    respond_to do |format|
      if @campanha.save
        format.html { redirect_to @campanha, notice: 'Campanha was successfully created.' }
        format.json { render json: @campanha, status: :created, location: @campanha }
      else
        format.html { render action: "new" }
        format.json { render json: @campanha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campanhas/1
  # PUT /campanhas/1.json
  def update
    @campanha = Campanha.find(params[:id])

    respond_to do |format|
      if @campanha.update_attributes(params[:campanha])
        format.html { redirect_to @campanha, notice: 'Campanha was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campanha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campanhas/1
  # DELETE /campanhas/1.json
  def destroy
    @campanha = Campanha.find(params[:id])
    @campanha.destroy

    respond_to do |format|
      format.html { redirect_to campanhas_url }
      format.json { head :no_content }
    end
  end
end
