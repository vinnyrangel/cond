class CreatePaginas < ActiveRecord::Migration
  def change
    create_table :paginas do |t|
      t.string :titulo, :null => false
      t.text :corpo, :null => false
      t.boolean :chamada, :default => true, :null => false
      t.boolean :ativo, :default => true, :null => false
      t.integer :usuario_id, :null => false
      t.integer :condominio_id, :null => false

      t.timestamps
    end
  end
end
