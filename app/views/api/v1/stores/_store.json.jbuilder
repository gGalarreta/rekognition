json.id           store.id
json.name         store.name
json.description  store.description
json.webpage      store.webpage
json.contact_name store.contact_name
json.phone_number store.phone_number
json.admin_id     store.admin_id
if store.logo.present?
  json.logo         store.image_url(field: "logo", size: "original")
else
  json.logo         json.null
end
if store.banner.present?
  json.banner       store.image_url(field: "banner", size: "original")
else
  json.banner         json.null
end
