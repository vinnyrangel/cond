class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :nome
      t.integer :condominio_id
      t.string :slug

      t.timestamps
    end
  end
end
