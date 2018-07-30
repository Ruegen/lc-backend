class LgasController < ApplicationController
    def index
        @lgas = LocalGovernmentArea.all
        render json: @lgas
    end
end