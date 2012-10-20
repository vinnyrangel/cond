class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :url
      t.string :path
      t.integer :parceiro_id
      t.datetime :data
      t.boolean :ativo

      t.timestamps
    end
  end
end
