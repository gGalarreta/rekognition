json.smart_tv_sponsor do
  json.partial! 'smart_tv_sponsor', smart_tv_sponsor: @smart_tv_sponsor 
  if @smart_tv_sponsor.background_color
    json.background_color do
      json.partial! 'api/v1/background_colors/background_color', background_color: @smart_tv_sponsor.background_color
    end
  else
    json.set! :background_color, JSON.parse("null")
  end
  json.stores @smart_tv_sponsor.stores do |store|
    json.partial! 'api/v1/stores/store', store: store
  end
end