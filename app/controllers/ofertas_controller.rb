class OfertasController < ApplicationController
  before_filter :authenticate_usuario!
  layout "admin"
  
  # GET /ofertas
  # GET /ofertas.json
  def index
    @ofertas = Oferta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ofertas }
    end
  end

  # GET /ofertas/1
  # GET /ofertas/1.json
  def show
    @oferta = Oferta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @oferta }
    end
  end

  # GET /ofertas/new
  # GET /ofertas/new.json
  def new
    @oferta = Oferta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @oferta }
    end
  end

  # GET /ofertas/1/edit
  def edit
    @oferta = Oferta.find(params[:id])
  end

  # POST /ofertas
  # POST /ofertas.json
  def create
    @oferta = Oferta.new(params[:oferta])

    respond_to do |format|
      if @oferta.save
        format.html { redirect_to @oferta, notice: 'Oferta was successfully created.' }
        format.json { render json: @oferta, status: :created, location: @oferta }
      else
        format.html { render action: "new" }
        format.json { render json: @oferta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ofertas/1
  # PUT /ofertas/1.json
  def update
    @oferta = Oferta.find(params[:id])

    respond_to do |format|
      if @oferta.update_attributes(params[:oferta])
        format.html { redirect_to @oferta, notice: 'Oferta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @oferta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ofertas/1
  # DELETE /ofertas/1.json
  def destroy
    @oferta = Oferta.find(params[:id])
    @oferta.destroy

    respond_to do |format|
      format.html { redirect_to ofertas_url }
      format.json { head :no_content }
    end
  end
end
