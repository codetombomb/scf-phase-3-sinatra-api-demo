class SessionsController < ApplicationController
    
    post '/login' do
        user = User.find_by(username: params[:username])
        if user.password === params[:password]
            session[:user_id] = user.id
            user.to_json(:only => [:username, :email], :include => :games )
        else
            { errors: ["Username or password was incorrect"] }.to_json
        end
    end

    delete '/logout' do
        session.delete :user_id
        status 204
    end
end