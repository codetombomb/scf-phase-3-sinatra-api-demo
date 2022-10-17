class GamesController < ApplicationController

    get '/games' do
        games = Game.all
        games.to_json 
    end
    
    post '/games' do
        game = Game.create(game_params)
        game.to_json
    end

    get '/games/:id' do
        game = Game.find_by(id: game_params[:id])
        game.to_json
    end


    patch '/games/:id' do
        game = Game.find_by(id: game_params["id"])
        game.update(game_params)
        game.to_json
    end

    delete '/games/:id' do 
        game = Game.find_by(id: game_params["id"])
        game.destroy
        status 204
    end

    private

    def game_params
        permitted = ["id", "user_id", "complete", "moves", "wrong_moves", "difficulty", "total_time_seconds"]
        if params["id"]
            params["id"] = params["id"].to_i
        end
        params.filter {|param| permitted.include?(param)}
    end
end