class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.integer :telefone
      t.date :data_nascimento
      t.integer :tamanho_familia
      t.integer :tipo_usuario_id
      t.integer :ultimo_aviso_visto

      t.timestamps
    end
  end
end
