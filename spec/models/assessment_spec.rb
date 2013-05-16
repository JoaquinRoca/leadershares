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

require 'spec_helper'

describe Assessment do
  pending "add some examples to (or delete) #{__FILE__}"
end
