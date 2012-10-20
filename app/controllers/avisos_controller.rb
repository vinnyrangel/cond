class AvisosController < ApplicationController
  before_filter :authenticate_usuario!
  layout "condominio"

  def index
    @avisos = Aviso.find_all_by_condominio_id(meu_condominio)
  end

  def show
  end

  def new
    @aviso = Aviso.new
  end

  def edit
    @aviso = Aviso.find_id(params[:id])
  end

  def create
    @aviso = Aviso.new(params[:aviso])

    respond_to do |format|
      if @aviso.save
        format.html { redirect_to condominio_avisos_path(:condominio_id => params[:condominio_id]) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @aviso = Aviso.find_by_slug(params[:id])

    respond_to do |format|
      if @aviso.update_attributes(params[:aviso])
        format.html { redirect_to condominio_avisos_path(:condominio_id => params[:condominio_id]) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @aviso = Aviso.find(params[:id])
    @aviso.destroy
  
    respond_to do |format|
      format.html { redirect_to condominio_avisos_path(:condominio_id => params[:condominio_id]) }
      format.json { head :ok }
    end
  end

end