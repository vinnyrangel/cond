class Servico < ActiveRecord::Base
  has_and_belongs_to_many :tipo_servicos
  belongs_to :parceiro
  
  has_attached_file :foto,  
                    :styles => { :thumb => "100x50>", :medium => "300x200>" }, 
                    :path => ":rails_root/public/servicos/:id/:style/:filename",
                    :url => "/servicos/:id/:style/:basename.:extension"
                    
  validates_attachment_size :foto, :less_than => 2.megabytes
end
