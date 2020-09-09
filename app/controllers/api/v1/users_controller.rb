class Api::V1::UsersController < Api::ApiV1Controller
  skip_before_action :verify_current_user, only: [:create, :create_admin]

  def create
    begin
      @user = User.new user_params
      if @user.save
        render :user
      else
        response_error(title: 'Could not register', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def me
    begin
      @user = current_user
      render :me
    rescue Exception => e
      render json: { message: e}
    end
  end

  def profile
    begin
      @user = current_user
      if @user.initialize_user(params[:user][:avatar_image], profile_params)
        render :me
      else
        response_error(title: 'Could not update user', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def product_promotions
    begin
      @user_promotions = current_user.get_user_promotions
      render :user_promotions
      rescue Exception => e
        render json: { message: e}
    end
  end

  def create_admin
    begin
      @user = User.new store_admin_params
      if @user.save
        render :user
      else
        response_error(title: 'Could not register', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def get_admins
    @users = User.find_admins
    render :users
  end

  def get_park_state
    begin
      @user = current_user
      render json: { flag_park: @user.flag_park}
    rescue Exception => e
      render json: { message: e}
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def profile_params
      params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :date_of_birth)
    end

    def store_admin_params
      params.require(:user).permit(:first_name, :last_name, :role_id, :email, :password)
    end
end
