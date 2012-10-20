class CreateApartamentos < ActiveRecord::Migration
  def change
    create_table :apartamentos do |t|
      t.integer :numero
      t.integer :predio_id
      t.integer :condominio_id

      t.timestamps
    end
  end
end
