class Api::V1::RolesController < Api::ApiV1Controller

  def index
    @roles = Role.all
    render :roles
  end

end
