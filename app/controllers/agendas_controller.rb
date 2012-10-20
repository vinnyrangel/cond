class AgendasController < ApplicationController
  before_filter :authenticate_usuario!
  layout "condominio"

  def index
    @agendas = Agenda.find_all_by_condominio_id(meu_condominio)
  end

  def show
  end

  def new
    @agenda = Agenda.new
    @condominio = Condominio.find_by_slug(params[:condominio_id])
  end

  def edit
    @agenda = Agenda.find_by_slug(params[:id])
    @condominio = Condominio.find_by_slug(params[:condominio_id])
  end

  def create
    @agenda = Agenda.new(params[:agenda])

    respond_to do |format|
      if @agenda.save
        format.html { redirect_to condominio_agendas_path(:condominio_id => params[:condominio_id]) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @agenda = Agenda.find_by_slug(params[:id])

    respond_to do |format|
      if @agenda.update_attributes(params[:agenda])
        format.html { redirect_to condominio_agendas_path(:condominio_id => params[:condominio_id]) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @agenda = Agenda.find(params[:id])
    @agenda.destroy

    respond_to do |format|
      format.html { redirect_to condominio_agendas_path(:condominio_id => params[:condominio_id]) }
      format.json { head :ok }
    end
  end
end
