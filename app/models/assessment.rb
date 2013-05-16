# == Schema Information
#
# Table name: assessments
#
#  id              :integer          not null, primary key
#  assessment_name :string(255)
#  assessment_id   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Each assessment should have a name, e.g., Dane's leadership thoughts
# I created an assessment_id variable which I think is a dup of id


class Assessment < ActiveRecord::Base
  # attr_accessible should only be accessible to admins

  # Every assessment needs a name
  validates :assessment_name, presence: true

	# Each assessment has a number of competencies which in turn
	# have a number of questions
	# If an assessment is destroyed, the competencies should live on
	# If the competency is destroyed, the assessment should be destroyed
	# Maybe this means competencies that are in use can't be destroyed?
  has_many :competencies, foreign_key: "competency_id"
end
