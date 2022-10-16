class UsersController < ApplicationController

    get '/users' do
        users = User.all
        users.to_json(:only => [:username, :email], :include => :games )
    end

    post '/users' do 
        user = User.create(params)
        user.to_json(:include => :games)
    end

    patch '/users/:id' do
        user = User.find_by(id: params[:id])
        if user 
            user.update(user_params)
            user.save
            user.to_json(:only => [:username, :email], :include => :games)
        else
            render_not_found
        end
    end

    delete '/users/:id' do
        user = User.find_by(id: user_params["id"])
        if user
            user.destroy
            status 204
        else
            render_not_found
        end
    end

    private

    def user_params
        permitted = ["username", "password", "email", "id"]
        params["id"] = params["id"].to_i
        params.filter {|param| permitted.include?(param)}
    end

    def render_not_found
        { errors: ["User with an id of #{user_params["id"]} was not found"] }.to_json 
    end
end
