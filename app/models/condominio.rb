class Condominio < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nome, use: :slugged
  
  has_many :usuarios
  has_many :predios
  
  # FIX
  attr_accessible :logo, :nome, :endereco, :lon, :lat, :logo_file_name, :logo_content_type, :logo_file_size, :logo_updated_at

  has_attached_file :logo, :styles => { :thumb => "956x156" },
                    :url => "/attachments/:id/original/:basename.:extension",
                    :path => ":rails_root/public/attachments/:id/original/:basename.:extension",
                    :default_url => "/assets/condominio_default.jpg"
end