# == Schema Information
#
# Table name: relationships
#
#  id           :integer          not null, primary key
#  target_id    :integer
#  rater_id     :integer
#  pairing_id   :integer
#  relationship :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :target_id

  belongs_to :rater, class_name: "User"
  belongs_to :target, class_name: "User"

  validates :rater_id, presence: true
  validates :target_id, presence: true
end
