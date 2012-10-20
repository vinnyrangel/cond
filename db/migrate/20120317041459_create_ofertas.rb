class CreateOfertas < ActiveRecord::Migration
  def change
    create_table :ofertas do |t|
      t.string :titulo
      t.text :descricao
      t.datetime :data
      t.string :preco_de
      t.string :preco_por
      t.integer :parceiro_id
      t.boolean :ativo
      t.has_attached_file :foto

      t.timestamps
    end
  end
end
