module CondominioHelper

	def total_predios
		@predios.size
	end

	def total_apartamentos
		a = []
		@predios.each do |p|
			a << p.andares * p.qtd_apart_andar
		end

		return a.inject(:+)
	end

	def total_moradoress
		Apartamento.find_all_by_condominio_id(@condominio.id).size
	end

end
