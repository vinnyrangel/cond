class CreatePredios < ActiveRecord::Migration
  def change
    create_table :predios do |t|
      t.string :nome
      t.integer :andares
      t.integer :qtd_apart_andar
      t.integer :telefone
      t.integer :condominio_id
      t.integer :sindico_id
      
      t.timestamps
    end
    
  end
end
