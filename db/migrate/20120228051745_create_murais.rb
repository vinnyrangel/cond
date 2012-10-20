class CreateMurais < ActiveRecord::Migration
  def change
    create_table :murais do |t|
      t.string :titulo, :null => false
      t.text :corpo, :null => false
      t.integer :usuario_id, :null => false
      t.integer :condominio_id, :null => false
      t.boolean :comentavel, :default => true, :null => false
      t.boolean :publico, :default => false, :null => false
      t.integer :parent_id

      t.timestamps
    end
  end
end
