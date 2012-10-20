class Agenda < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nome, use: :slugged
  
  belongs_to :condominio
  has_many :eventos
end