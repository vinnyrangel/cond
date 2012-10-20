class AddAvatarColumnsToCondominios < ActiveRecord::Migration
  def self.up
    change_table :condominios do |t|
      t.has_attached_file :logo
    end
  end

  def self.down
    drop_attached_file :condominios, :logo
  end
end

