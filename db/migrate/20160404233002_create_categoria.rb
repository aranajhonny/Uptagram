class CreateCategoria < ActiveRecord::Migration
    def change
    create_table :categorias do |t|
      t.references :photo, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
