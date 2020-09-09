json.id             event.id
json.name           event.name
json.location       event.location
json.all_day        event.all_day
if event.all_day
  json.initial_time   ""
  json.final_time     ""
else
  json.initial_time   event.initial_time.strftime("%I:%M %p")
  json.final_time     event.final_time.strftime("%I:%M %p")
end
json.event_date     event.event_date.strftime("%d de ")+Event::MESES[event.event_date.strftime("%m").to_i-1]
json.raw_date       event.format_date("event_date")
json.banner         event.image_url(field: "banner", size: "original")