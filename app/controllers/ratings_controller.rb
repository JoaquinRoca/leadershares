class RatingsController < ApplicationController
  # Make sure the correct user is doing the rating
  before_filter :correct_user,   only: [:edit, :update]
  # Only an admin can detroy a rating
  before_filter :admin_user,     only: :destroy

  # Create a new rating action
  def new
    @rating = Rating.new
  end

  # Create a rating score action
  def create
    @rating = Rating.new(params[:rating])
  end

  # Edit a rating action
  # I don't think ratings should be editable, maybe this action shouldn't exist?
  def edit
  end

  # The destroy rating function should only be available to admins
  def destroy
    Rating.find(params[:id]).destroy
    flash[:success] = "Rating destroyed."
    redirect_to ratings_url
  end

  private

    # Make sure a rater is signed in to give ratings
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # Make sure the correct rater is signed in to give ratings
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    # Create an admin user check
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
