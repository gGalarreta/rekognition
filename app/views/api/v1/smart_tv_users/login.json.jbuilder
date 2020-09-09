json.login do
  if @valid_user
    json.authenticate   @valid_user
    json.id             @smart_tv_user.id
    json.user_tv        @smart_tv_user.user_tv
  end
end