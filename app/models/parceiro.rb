class Parceiro < ActiveRecord::Base
  has_many :ofertas
  has_many :banners
  has_many :servicos
  has_many :campanhas
end
