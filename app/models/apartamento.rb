class Apartamento < ActiveRecord::Base
  belongs_to :predio
  belongs_to :usuario_apartamento
  belongs_to :condominio
end
