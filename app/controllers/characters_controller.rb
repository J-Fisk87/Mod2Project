class CharactersController < ApplicationController
    def index
        @characters = Character.all
    end

    def show
        @character = Character.find(params[:id])
    end

    def new
        @character = Character.new
        3.times { @character.klasses.build}

    end

    def create
        @character = Character.new(character_params)

        # @character.name = params[:character][:name]
        # @character.choose_klass(params[:character][:klass], params[:character][:lvl])

        # Change level to charklasses
        # Need Strong Params
        # Cocoon for forms


        
        

        # 3.times do |x|
        #     if params[:character][:character_klasses_attributes][x.to_s][:klass_id] != "1"
        #         @character.klasses << Klass.all.find(params[:character][:character_klasses_attributes][x.to_s][:klass_id].to_i)
        #         @character.character_klasses.last.level = params[:character][:character_klasses_attributes][x.to_s][:level].to_i
        #     end
        # end

        

        if @character.save
            @character.randomize_spells
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

        @character.update(character_params)
        if @character.save
            @character.randomize_spells
            redirect_to character_path(@character)
        else
            render :new
        end
    end

    def delete
        
    end

    private
        def character_params
            params.require(:character).permit(:name, klasses_attributes: [:id, :name, character_klass_attributes: [:id, :level]] )
    end
end
