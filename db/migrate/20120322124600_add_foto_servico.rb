class AddFotoServico < ActiveRecord::Migration
  def self.up
    change_table :servicos do |t|
      t.has_attached_file :foto
    end
  end

  def self.down
    drop_attached_file :servicos, :foto
  end
end
