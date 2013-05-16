class QuestionsController < ApplicationController
  # Create permissions for Questions
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :requested, :targets]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  # show questions action
  def show
    @user = User.find(params[:id])
  end

  # New question action for admins
  def new
    @user = User.new
  end

  # Create question action for admins
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Leadershares"
      redirect_to @user
    else
      render 'new'
    end
  end

  # Edit question action
  def edit
  end

  # Edit question action
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Index to show all questions
  def index
    @users = User.paginate(page: params[:page])
  end

  # Destroy question action
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  # Define a request action
  def requested
    @title = "Rater requests"
    @user = User.find(params[:id])
    @users = @user.rater_users.paginate(page: params[:page])
    render 'request_target'
  end

  # Define a target action
  def targets
    @title = "Targets"
    @user = User.find(params[:id])
    @users = @user.target_users.paginate(page: params[:page])
    render 'request_target'
  end

  private

    # Make sure a signed in user can answer questions
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # Make sure it is the correct user to answer questions
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    # Create an admin action
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end

end
