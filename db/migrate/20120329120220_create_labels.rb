class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.references :owner

      t.timestamps
    end
    add_index :labels, :owner_id
  end
end
