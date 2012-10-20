class CreateParceiros < ActiveRecord::Migration
  def change
    create_table :parceiros do |t|
      t.string :nome
      t.string :endereco
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
