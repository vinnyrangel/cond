class TipoServico < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nome, use: :slugged
  
  has_and_belongs_to_many :servicos
end
