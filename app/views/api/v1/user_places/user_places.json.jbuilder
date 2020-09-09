json.user_places @user_places do |user_place|
  json.partial! 'user_place', user_place: user_place
end