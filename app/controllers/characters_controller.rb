class CharactersController < ApplicationController
    def index
        @characters = Character.all
    end

    def show
        @character = Character.find(params[:id])
    end

    def new
        @character = Character.new
    end

    def create
        @character = Character.new
        @character.name = params[:character][:name]
        binding.pry


        if @character.save
            redirect_to character_path(@character)
        else
            render :new
        end

    end

    def edit
        @character = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])

        @character.update(params.require(:character).permit(:name))
        redirect_to character_path(@character)
    end
end
