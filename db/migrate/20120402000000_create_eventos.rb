class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :agenda_id
      t.string :titulo
      t.text :descricao
      t.integer :status
      t.integer :usuario_id
      t.date :dia

      t.timestamps
    end
  end
end
