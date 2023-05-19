class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Get all Players 
  get "/players" do
    players = Player.all
    players.to_json
  end
  
  # # get specifc player from id
  # get '/players/:id' do 
  #   player = Player.find(params[:id])
  #   player.to_json
  # end 

  
  get '/people/:sport' do 
    player = Player.where(sport: params[:sport])
    player.to_json
  end 

  # create a new player
  post "/players" do
    Player.create(name:params[:name], team:params[:team], sport:params[:sport])
    player = Player.all
    player.to_json
  end 
  
  post "/post_player/:sport" do 
    Player.create(name:params[:name], team:params[:team], sport:params[:sport])
    players = Player.where(sport: params[:sport])
    players.to_json
  end 

  

  get "/test_cards/:player_id" do 
    cards = Card.where(player_id: params[:player_id])
    cards.to_json
  end



  # deletes single card of a player
  delete '/cards/:id' do 
    card = Card.find(params[:id])
    card.destroy
    # cards = Card.where(player_id: params[:player_id])
    card.to_json
  end 

 

  post "/cards_test/:player_id" do
    Card.create(price:params[:price], grade:params[:grade], 
    number:params[:number], signed:params[:signed],
    jersey:params[:jersey], player_id:params[:player_id])
    cards = Card.where(player_id: params[:player_id])
    cards.to_json
  end 


  patch '/update_card/:id' do 
    card = Card.find(params[:id])
    card.update(
      price:params[:price], grade:params[:grade], 
      number:params[:number], signed:params[:signed],
      jersey:params[:jersey]
    )
    cards = Card.where(player_id: params[:player_id])
    cards.to_json
  end


  delete '/delete_player/:id' do
    player = Player.find(params[:id])
    player.destroy
end

end
