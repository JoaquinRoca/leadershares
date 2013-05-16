module RatingsHelper

# The person leaving the rating should match the person who was requested to rate
# The problem is this person shouldn't have to sign in to leave a rating
# There should be a unique url sent to the rater who was requested
# This code is wrong but acts as a placeholder
  def rater?(user)
    @current_user ||= User.find_by_rater_id
  end

end
