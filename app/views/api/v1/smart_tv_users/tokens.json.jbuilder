json.session do
  json.partial! 'api/v1/sessions/session', session: @session
end