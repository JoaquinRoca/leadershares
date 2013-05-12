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

require 'spec_helper'

describe Relationship do
  pending "add some examples to (or delete) #{__FILE__}"
end
