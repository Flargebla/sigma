class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.integer :aside
      t.integer :bside
      t.timestamps
    end
  end
end
