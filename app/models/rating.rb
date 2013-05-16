# == Schema Information
#
# Table name: ratings
#
#  id             :integer          not null, primary key
#  question_score :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Scores for each question should be collected here and associated with
# a relationship pairing

class Rating < ActiveRecord::Base
	# The attribute has to be accessible so the rater can update the score
	# Should only be accessible to the rater (who might also be the target)
  attr_accessible :question_score

	# The rating belongs to both rater, target, and the relationships
  belongs_to :relationship_id
  belongs_to :rater, class_name: "User"
  belongs_to :target, class_name: "User"

	# There has to be a rater and a target as well as a question score
	# The score can be a number or an NA
  validates :rater_id, presence: true
  validates :target_id, presence: true
  validates :question_score, presence: true

	# Creating a from_users_requested_by method to use in user.rb def item_score
	# I think this is missing a way to aggregate by rater group and by question
	# We'll also need to make one where we aggregate to the competency level
	def self.from_users_requested_by(user)
		requested_user_ids = "SELECT rater_id FROM relationships
													WHERE target_id = :user_id"
		where("user_id IN (#{target_user_ids}) OR user_id = :user_id",
					user_id: user.id)
	end
end
