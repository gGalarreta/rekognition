json.users @users do |user|
  json.id     user.id
  json.email  user.email
  json.first_name   user.first_name
  json.last_name    user.last_name
  json.role_id      user.role_id
end