class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  # Create relationship action
  def create
    @user = User.find(params[:relationship][:rater_id])
    current_user.request!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end