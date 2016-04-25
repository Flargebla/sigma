class CreateSigs < ActiveRecord::Migration
  def change
    create_table :sigs do |t|
      t.string :title
      t.belongs_to :user, index: true
      t.text :file
      t.integer :likes
      t.timestamps
    end
  end
end
