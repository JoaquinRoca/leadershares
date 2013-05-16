class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.string :competency_name

      t.timestamps
    end
  end
end
