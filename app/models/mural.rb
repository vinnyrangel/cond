class Mural < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :usuario
  belongs_to :parent, :class_name => "Mural"
  has_many :childs, :class_name => "Mural", :foreign_key => "parent_id", :dependent => :destroy
  
  # suporte a comentário
  opinio_subjectum
  
  validates_presence_of     :condominio, :usuario, :titulo, :corpo
  
end
