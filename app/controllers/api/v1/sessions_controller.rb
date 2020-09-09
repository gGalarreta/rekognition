class Api::V1::SessionsController < Api::ApiV1Controller
  
  skip_before_action :verify_current_user, only: [:create, :smart_tv, :fb, :gmail]

  def create
    begin
      email = session_params[:email].downcase
      password = session_params[:password]
      unless email.blank? and password.blank?
        user = User.find_by(email: email)
        if user    
          if user.valid_password?(password)
            @session = user.sessions.create
            render :show
          else
            response_error(title: "The session could not be initiated", reasons: {password: "is invalid"}, description: "Try again with valid values", status_code: 422)
          end
        else
          response_error(title: "The session could not be initiated", reasons: {email: "is invalid"}, description: "Try again with valid values", status_code: 422)
        end
      end  
    rescue Exception => e
      render json: { message: e}
    end
  end

  def smart_tv
    user_avatar = params[:photo]
    if user_avatar.present?
      user = User.face_recognition user_avatar
      if user
        @session = user.sessions.create
        render :show
      else
        response_error(title: "The session could not be initiated", reasons: {photo: "No se relaciono la foto con un usuario"}, description: "Try again with valid values", status_code: 422)
      end
    else
      response_error(title: "The session could not be initiated", reasons: {photo: "Foto invalida"}, description: "Try again with valid values", status_code: 422)
    end
  end

  def fb
    email = fb_session_params[:email].downcase
    if email.present?
      user = User.login_sign_in_wth_fb fb_session_params[:name], email
      @session = user.sessions.create
      render :show
    else
      response_error(title: "The session could not be initiated", reasons: {password: "is invalid"}, description: "Try again with valid values", status_code: 422)
    end
  end

  def gmail
    email = gmail_session_params[:email].downcase
    if email.present?
      user = User.login_sign_in_wth_gmail email
      @session = user.sessions.create
      render :show
    else
      response_error(title: "The session could not be initiated", reasons: {password: "is invalid"}, description: "Try again with valid values", status_code: 422)
    end
  end

  def logout
    begin
      if current_user.sessions.last.destroy
        render json: {message: "Cierre de sesion exitoso"}
      else
        render json: {message: "Ha ocurrido en el cierre de sesion"}
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  private

    def fb_session_params
      params.permit(:name, :email)
    end

    def gmail_session_params
      params.permit(:email)
    end

    def session_params
      params.permit(:email, :password)
    end
end
