class AddAvatarUsuario < ActiveRecord::Migration
  def self.up
    change_table :usuarios do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :usuarios, :avatar
  end
end
