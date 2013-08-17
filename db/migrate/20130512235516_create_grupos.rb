class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :nome, :limit => 100, :null => false

      t.timestamps
    end
    add_index :grupos, :nome, :unique => true
  end
end
