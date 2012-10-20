class AddImagemBanner < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.has_attached_file :imagem
    end
  end

  def self.down
    drop_attached_file :banners, :imagem
  end
end
