# == Schema Information
#
# Table name: competencies
#
#  id              :integer          not null, primary key
#  competency_name :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Each competency should have a name, e.g., Active listening

class Competency < ActiveRecord::Base
  # attr_accessible should only be accessible to admins

	# Each competency can belong to a number of assessments
  belongs_to :assessment

	# Each competency has a number of questions
	# If a competency is destroyed, the questions should live on
	# If the questions are destroyed, the competency should be destroyed
	# Maybe this means questions that are in use can't be destroyed?
  has_many :questions, foreign_key: "question_id"
end
