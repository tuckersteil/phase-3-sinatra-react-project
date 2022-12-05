class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Get all Players 
  get "/players" do
    players = Player.all
    players.to_json
  end
  
  # get specifc player from id
  get '/players/:id' do 
    player = Player.find(params[:id])
    player.to_json
  end 

  get '/player/nfl' do 
    player = Player.where(sport: 'NFL')
    player.to_json
  end 

  get '/player/nba' do 
    player = Player.where(sport: 'NBA')
    player.to_json
  end 

  get '/player/mlb' do 
    player = Player.where(sport: 'MLB')
    player.to_json
  end 

  get '/player/nhl' do 
    player = Player.where(sport: 'NHL')
    player.to_json
  end 

  # get specific player and all their cards 
  get '/player_cards/:player_id' do 
    player_cards = Card.where(player_id: params[:player_id])
    # player_cards.to_json(include: :cards)
    player_cards.to_json(include: :player)
  end 

  # create a new player
  post "/players" do
    Player.create(name:params[:name], team:params[:team], sport:params[:sport])
    player = Player.all
    player.to_json
  end 


  post "/testplayer/nhl" do 
    Player.create(name:params[:name], team:params[:team], sport:params[:sport])
    players = Player.where(sport: 'NHL')
    players.to_json
  end

  post "/testplayer/nfl" do 
    Player.create(name:params[:name], team:params[:team], sport:params[:sport])
    players = Player.where(sport: 'NFL')
    players.to_json
  end

  post "/testplayer/mlb" do 
    Player.create(name:params[:name], team:params[:team], sport:params[:sport])
    players = Player.where(sport: 'MLB')
    players.to_json
  end

  get "/test_cards/:player_id" do 
    cards = Card.where(player_id: params[:player_id])
    cards.to_json
  end

  # delete a specific player
  delete '/delete_player/:id' do 
    player = Player.find(params[:id])
    player.destroy
    player.to_json
  end 



  # Get all cards 
  get "/cards" do
    cards = Card.all
    cards.to_json(include: :player)
  end

  # get specifc card from id
  get '/cards/:id' do 
    cards = Card.find(params[:id])
    cards.to_json(include: :player)
  end   

  # deletes single card of a player
  delete '/cards/:id' do 
    card = Card.find(params[:id])
    card.destroy
    # cards = Card.where(player_id: params[:player_id])
    card.to_json
  end 

  # create a new card
  post "/cards" do
    card = Card.create(price:params[:price], grade:params[:grade], 
    number:params[:number], signed:params[:signed],
    jersey:params[:jersey], player_id:params[:player_id])
    card.to_json
  end 

  post "/cards_test/:player_id" do
    Card.create(price:params[:price], grade:params[:grade], 
    number:params[:number], signed:params[:signed],
    jersey:params[:jersey], player_id:params[:player_id])
    cards = Card.where(player_id: params[:player_id])
    cards.to_json
  end 

  patch '/cards/:id' do 
    card = Card.find(params[:id])
    card.update(
      price:params[:price], grade:params[:grade], 
      number:params[:number], signed:params[:signed],
      jersey:params[:jersey]
    )
    card.to_json
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


end
