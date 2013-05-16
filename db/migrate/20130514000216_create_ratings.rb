class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :question_score

      t.timestamps
    end
  end
end
