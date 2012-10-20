class Predio < ActiveRecord::Base
  has_many :apartamentos
  belongs_to :condominio
end