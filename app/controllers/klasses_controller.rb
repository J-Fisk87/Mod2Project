class KlassesController < ApplicationController
    def index
        @klasses = Klass.all
    end

    def show
        @klass = Klass.find(params[:id])
    end



end