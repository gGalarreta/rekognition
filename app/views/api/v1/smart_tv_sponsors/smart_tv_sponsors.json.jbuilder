json.smart_tv_sponsors @smart_tv_sponsors do |smart_tv_sponsor|
  json.partial! 'smart_tv_sponsor', smart_tv_sponsor: smart_tv_sponsor 
  if smart_tv_sponsor.background_color
    json.background_color do
      json.partial! 'api/v1/background_colors/background_color', background_color: smart_tv_sponsor.background_color
    end
  else
    json.set! :background_color, JSON.parse("null")
  end
end