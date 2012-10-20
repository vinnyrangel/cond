class CondominiosController < ApplicationController
  before_filter :authenticate_usuario!
  load_and_authorize_resource
  layout "condominio"
  
  def index
    @condominios = Condominio.all
  end

  def show
    @condominio = Condominio.find(params[:id])
    @murais = Mural.where(:condominio_id => @condominio)
    @murais.where(:publico => true) unless current_usuario

    
    #aviso_id = current_usuario.ultimo_aviso_visto.to_i + 1
    aviso_id = 1

    @aviso = Aviso.where(:id => aviso_id, :condominio_id => @condominio).first

    #TEMP DE OFERTAS
    #TODO: Criar campanhas
    @oferta = Oferta.first

    @agendas = Agenda.find_all_by_condominio_id(@condominio.id)
  end

  def new
    @condominio = Condominio.new
  end

  def edit
    @condominio = Condominio.find(params[:id])
  end

  # POST /condominio
  # POST /condominio.json
  def create
    @condominios = Condominio.new(params[:condominio])

    respond_to do |format|
      if @condominios.save
        format.html { redirect_to @condominios, notice: 'Condominio was successfully created.' }
        format.json { render json: @condominios, status: :created, location: @condominios }
      else
        format.html { render action: "new" }
        format.json { render json: @condominios.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /condominio/1
  # PUT /condominio/1.json
  def update
    @condominios = Condominio.find(params[:id])

    respond_to do |format|
      if @condominios.update_attributes(params[:condominio])
        format.html { redirect_to @condominios, notice: 'Condominio was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @condominios.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condominio/1
  # DELETE /condominio/1.json
  def destroy
    @condominios = Condominio.find(params[:id])
    @condominios.destroy

    respond_to do |format|
      format.html { redirect_to condominia_url }
      format.json { head :ok }
    end
  end
  
  def servicos
    @condominio = Condominio.find(params[:id])
    @tipos_servicos = TipoServico.all
    
    #if params[:tipo].empty? 
      @tipo = TipoServico.find(params[:tipo])
      @servicos = @tipo.servicos.all
    #end
  end
end
