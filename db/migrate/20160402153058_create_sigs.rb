class CreateSigs < ActiveRecord::Migration
  def change
    create_table :sigs do |t|
      t.string :title
      t.text :tags
      t.text :file
      t.integer :likes

      t.timestamps
    end
  end
end
