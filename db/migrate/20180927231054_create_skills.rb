class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :titulo
      t.integer :porcentaje_utilizado

      t.timestamps
    end
  end
end
