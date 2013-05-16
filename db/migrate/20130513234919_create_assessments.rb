class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :assessment_name
      t.string :assessment_id

      t.timestamps
    end
  end
end
