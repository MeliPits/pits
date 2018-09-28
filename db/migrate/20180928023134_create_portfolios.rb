class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :titulo
      t.string :subtitulo
      t.text :cuerpo
      t.text :main_imagen
      t.text :thumb_imagen

      t.timestamps
    end
  end
end
