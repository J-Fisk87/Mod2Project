class CharactersController < ApplicationController
    def index
        @characters = Character.all
    end

    def show
        @character = Character.find(params[:id])
    end

    def new
        @character = Character.new
        @character.klasses.build
    end

    def create
        @character = Character.new
        @character.name = params[:character][:name]
        @character.choose_klass(params[:character][:klass], params[:character][:lvl])
        binding.pry

        # Change level to charklasses
        # Need Strong Params
        # Cocoon for forms

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

    def delete
        
    end

    def character_params
        params.require(:character).permit(:name, klass_attributes: [:id, :name, :done, :_destroy], character_klass_attributes: [:id, :level, :done, :_destroy])
      end
end
