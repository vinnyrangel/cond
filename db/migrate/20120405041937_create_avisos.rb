class CreateAvisos < ActiveRecord::Migration
  def change
    create_table :avisos do |t|
      t.text :corpo
      t.integer :condominio_id

      t.timestamps
    end
  end
end
