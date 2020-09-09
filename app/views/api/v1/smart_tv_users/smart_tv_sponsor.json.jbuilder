json.smart_tv_user do
  json.partial! 'smart_tv_user', smart_tv_user: @smart_tv_user 
  json.smart_tv_sponsor do
    json.partial! 'api/v1/smart_tv_sponsors/smart_tv_sponsor', smart_tv_sponsor: @smart_tv_sponsor
  end
end