class UsuarioApartamento < ActiveRecord::Base
	belongs_to :apartamento
	has_one :usuario
end
