class Pagina < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :usuario
  
  # suporte a comentário
  opinio_subjectum
  
  validates_presence_of     :condominio, :titulo, :corpo
end
