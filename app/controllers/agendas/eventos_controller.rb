class Agendas::EventosController < ApplicationController
  layout "condominio"

  def index
    agenda = Agenda.find_by_slug(params[:agenda_id])
    @eventos = Evento.find(:all, :conditions => ['agenda_id = ? AND dia >= ?', agenda.id, Date.today])
  end

  def new
    @evento = Evento.new
    @condominio = Condominio.find_by_slug(params[:condominio_id])
    @agenda = Agenda.find_by_slug(params[:agenda_id])
  end

  def create
    agenda = Agenda.find_by_slug(params[:agenda_id])
    @evento = Evento.new(params[:evento])

    @evento.agenda_id = agenda
    @evento.usuario_id = current_usuario.id

    respond_to do |format|
      if @evento.save
        format.html { redirect_to condominio_agendas_path(:condominio_id => params[:condominio_id]) }
      else
        format.html { render action: "new" }
      end
    end
  end

end