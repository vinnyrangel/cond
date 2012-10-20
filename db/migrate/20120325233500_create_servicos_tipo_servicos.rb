class CreateServicosTipoServicos < ActiveRecord::Migration
  def self.up
    create_table :servico_tipo_servico, :id => false do |t|
      t.integer :servico_id
      t.integer :tipo_servico_id
    end
  end
end
