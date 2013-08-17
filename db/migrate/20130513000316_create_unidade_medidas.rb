class CreateUnidadeMedidas < ActiveRecord::Migration
  def change
    create_table :unidade_medidas do |t|
      t.string :nome, :limit => 100, :null => false

      t.timestamps
    end
    add_index :unidade_medidas, :nome, :unique => true
  end
end
