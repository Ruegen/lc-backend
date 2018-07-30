class Properties < ApplicationController

    before_action :set_property, only: [:show]

    def index
        @properties = Property.all
        render json: @properties, include: [:address, :local_government_area]
    end

    def show  
        render json: @property, include: [:address, :local_government_area]
    end

    private
    def set_property
        @property = Property.find(params[:id])
    end

end