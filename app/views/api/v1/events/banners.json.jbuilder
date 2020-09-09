json.banners @events do |event|
  json.id         event.id
  json.banner     event.image_url(field: "banner", size: "original")
end