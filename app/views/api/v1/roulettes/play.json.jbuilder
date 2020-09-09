json.play do
  if @already_played
    json.set! :message, 'Ya se jugo'    
  else
    json.set! :message, 'Juego exitoso'    
  end
end