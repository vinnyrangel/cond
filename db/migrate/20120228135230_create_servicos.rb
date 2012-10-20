class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string :nome
      t.integer :tipo_servico_id
      t.text :descricao
      t.string :endereco
      t.string :telefone

      t.timestamps
    end
  end
end
