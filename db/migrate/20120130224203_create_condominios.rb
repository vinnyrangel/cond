class CreateCondominios < ActiveRecord::Migration
  def change
    create_table :condominios do |t|
      t.string :nome, :null => false
      t.string :endereco
      t.string :lat
      t.string :lon
      t.string :slug

      # configuracoes
      t.boolean :moderacao, :default => false
      t.boolean :privado, :default => true
      t.boolean :user_visibilidade, :default => true
      
      t.timestamps
    end

    add_index :condominios, :slug, unique: true
  end
end
