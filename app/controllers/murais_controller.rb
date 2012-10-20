class MuraisController < ApplicationController
  before_filter :authenticate_usuario!
  layout "condominio"
  
  # GET /murais
  # GET /murais.json
  def index
    @murais = Mural.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @murais }
    end
  end

  # GET /murais/1
  # GET /murais/1.json
  def show
    @mural = Mural.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mural }
    end
  end

  # GET /murais/new
  # GET /murais/new.json
  def new
    @mural = Mural.new
    @mural.usuario = current_usuario

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mural }
    end
  end

  # GET /murais/1/edit
  def edit
    @mural = Mural.find(params[:id])
  end

  # POST /murais
  # POST /murais.json
  def create
    @mural = Mural.new(params[:mural])
    @mural.usuario = current_usuario
    @mural.condominio = meu_condominio

    respond_to do |format|
      if @mural.save
        format.html { redirect_to @mural, notice: 'Mural criado com sucesso' }
        format.json { render json: @mural, status: :created, location: @mural }
      else
        format.html { render action: "new" }
        format.json { render json: @mural.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /murais/1
  # PUT /murais/1.json
  def update
    @mural = Mural.find(params[:id])

    respond_to do |format|
      if @mural.update_attributes(params[:mural])
        format.html { redirect_to @mural, notice: 'Mural was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mural.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /murais/1
  # DELETE /murais/1.json
  def destroy
    @mural = Mural.find(params[:id])
    @mural.destroy

    respond_to do |format|
      format.html { redirect_to murais_url }
      format.json { head :ok }
    end
  end


end
