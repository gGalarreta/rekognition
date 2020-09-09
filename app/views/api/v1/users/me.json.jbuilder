json.user do
  json.id                         @user.id
  json.email                      @user.email
  json.first_name                 @user.first_name
  json.last_name                  @user.last_name
  json.phone_number               @user.phone_number
  json.date_of_birth              @user.format_date("date_of_birth")
  json.avatar                     @user.image_url(field: "avatar")
  json.gamification_points_amount @user.gamification_points_amount.to_i
  json.flag_park                  @user.flag_park
end