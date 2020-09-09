json.check do
  json.status       @already_played
  if @already_played
    json.set! :message, 'Ya se jugo'    
  else
    json.set! :message, 'Aun no se ha jugado'    
  end
end