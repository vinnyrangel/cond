class Usuarios::AdminsController < ApplicationController
  before_filter :authenticate_usuario!  
  layout "admin"

	def index
	end

	def predios
		condominio_id = current_usuario.apartamento.predio.condominio.id

		@predios = Predio.find_all_by_condominio_id(condominio_id)
	end

	def moradores
	end

	def convidar_moradores
	end
end
