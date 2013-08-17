class CreateSupermercados < ActiveRecord::Migration
  def change
    create_table :supermercados do |t|
      t.string :nome, :limit => 100, :null => false

      t.timestamps
    end
    add_index :supermercados, :nome, :unique => true
  end
end
