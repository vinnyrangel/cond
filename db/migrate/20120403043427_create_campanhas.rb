class CreateCampanhas < ActiveRecord::Migration
  def change
    create_table :campanhas do |t|
      t.integer :parceiro_id
      t.string :publicidade_tipo
      t.integer :publicidade_id
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :pageviews
      t.integer :clicks
      t.boolean :ativo

      t.timestamps
    end
  end
end
