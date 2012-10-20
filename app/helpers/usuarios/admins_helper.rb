module Usuarios::AdminsHelper

	def nome_condominio
		Condominio.find_by_id(current_usuario.apartamento.predio.condominio.id).nome
	end

	def total_moradores
		Apartamento.find_all_by_condominio_id(current_usuario.apartamento.predio.condominio.id).size
	end

	def total_predios
		Predio.find_all_by_condominio_id(current_usuario.apartamento.predio.condominio.id).size
	end

	# TODO
	def total_chamados_abertos
		2
	end
end
