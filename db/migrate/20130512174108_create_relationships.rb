class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :target_id
      t.integer :rater_id
      t.integer :pairing_id
      t.string :relationship

      t.timestamps
    end

    add_index :relationships, :target_id
    add_index :relationships, :rater_id
    add_index :relationships, :pairing_id
  end
end
