class Oferta < ActiveRecord::Base
  belongs_to :parceiro
  
  has_attached_file :foto,  
                    :styles => { :thumb => "300x100>", :medium => "300x450>" }, 
                    :path => ":rails_root/public/ofertas/:id/:style/:filename",
                    :url => "/ofertas/:id/:style/:basename.:extension"
                    
  validates_attachment_size :foto, :less_than => 2.megabytes
end
