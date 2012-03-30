class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.references :owner
      t.references :label
      t.integer :hits

      t.timestamps
    end
    add_index :notes, :owner_id
    add_index :notes, :label_id
  end
end
