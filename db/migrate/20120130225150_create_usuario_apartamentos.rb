class CreateUsuarioApartamentos < ActiveRecord::Migration
  def up
    create_table :usuario_apartamentos, :id => false do |t|
      t.integer :usuario_id
      t.integer :apartamento_id
    end
  end
end
