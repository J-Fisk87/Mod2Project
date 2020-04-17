class CharactersController < ApplicationController
    def index
        @characters = Character.all
    end

    def show
        @character = Character.find(params[:id])
    end

    def new
        @character = Character.new
        3.times { @character.klasses.build }

    end

    def create
        @character = Character.new(character_params)

        if @character.save
            @character.randomize_spells
            redirect_to character_path(@character)
        else
            render :new
        end

    end

    def edit
        @character = Character.find(params[:id])
        @character_klasses = @character.character_klasses
    end

    def update
        @character = Character.find(params[:id])

        @character.update(character_params)
        if @character.save
            @character.randomize_spells
            redirect_to character_path(@character)
        else
            render :new
        end
    end

    def destroy
        Character.find(params[:id]).destroy
        redirect_to '/characters/new'
    end

    private
        def character_params
            params.require(:character).permit(:name, klasses_attributes: [:id, :name, character_klass_attributes: [:id, :level]] )
    end
end
