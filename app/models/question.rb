# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  question_text :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Each question should have text, e.g., How often does [USER] paraphrase?

class Question < ActiveRecord::Base
  # attr_accessible should only be accessible to admins

	# Each question can belong to a number of competencies
  belongs_to :competency
end
