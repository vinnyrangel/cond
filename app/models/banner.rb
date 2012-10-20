class Banner < ActiveRecord::Base
  belongs_to :parceiro
  
  has_attached_file :imagem,  
                    :styles => { :thumb => "50x50>", :small =>"300x100", :medium => "300x300", :full => "720x90>" }, 
                    :path => ":rails_root/public/banners/:id/:style/:filename",
                    :url => "/banners/:id/:style/:basename.:extension"
                    
  validates_attachment_size :imagem, :less_than => 2.megabytes
end
