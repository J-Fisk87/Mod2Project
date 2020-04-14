class UsersController < ApplicationController
    def show
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.name = params[:user][:name]


        if @character.save
            redirect_to character_path(@character)
        else
            render :new
        end

    end


    
end