class CreateTipoServicos < ActiveRecord::Migration
  def change
    create_table :tipo_servicos do |t|
      t.string :nome
      t.string :slug
      t.boolean :categoria

      t.timestamps
    end
  end
end
